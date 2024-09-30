            create_gitlab_user_token() {
                # Input parameters
                username="$1"
                scopes="$2"  # Scopes as a comma-separated list
                secretName="$3"
                secretNamespace="$4"
                secretKeyName="$5"

                # Function for logging messages with timestamp in UTC in parentheses
                log_message() {
                    echo "$(date -u +'%Y-%m-%d %H:%M:%S') (UTC) $1"
                }

                log_message "Making bot account for $username"

                # Combining all kubectl exec calls into a single call
                user_info=$(kubectl exec -n gitlab deployment/gitlab-toolbox -- bash -c "gitlab-rails runner -e production \"
                    # Step 1: Check if the user already exists
                    user = User.find_by_username('$username');
                    if user.present?
                        puts 'User already exists'
                        puts 'User details:'
                        puts 'Username: ' + user.username
                        puts 'Email: ' + user.email
                        puts 'Name: ' + user.name
                        puts 'Active: ' + user.state # Whether the user is active or blocked
                        puts 'Created at: ' + user.created_at.to_s # Log the created date
                        exit 1
                    end

                    # Step 2: Create the user account if it doesn't exist
                    password = SecureRandom.alphanumeric(16)
                    STDERR.puts 'Generated password is: ' + password  # Send password info to stderr to avoid mixing with the token

                    user = User.new(username: '$username', email: '$username@example.com', name: '$username', password: password);
                    user.assign_personal_namespace(Organizations::Organization.default_organization);
                    user.skip_confirmation! # Skip email confirmation
                    user.save!

                    # Step 3: Generate a personal access token (PAT) for the user with multiple scopes
                    scopes = '$scopes'.split(',').map(&:strip).map(&:to_sym)  # Properly split and convert scopes to symbols
                    token = user.personal_access_tokens.create(
                        scopes: scopes,  # Pass scopes as an array of symbols
                        name: 'Bot Account $username Access Token', 
                        expires_at: 365.days.from_now
                    );
                    token.save!
                    puts token.token  # Only print the token to stdout
                \"")

                # If the user already exists, the script will exit early and return additional details
                if echo "$user_info" | grep -q "User already exists"; then
                    log_message "$user_info"
                    log_message "User '$username' already exists. Exiting."
                    exit 0
                elif [ -z "$user_info" ]; then
                    log_message "Failed to generate personal access token for '$username'."
                    exit 1
                fi

                log_message "Generated personal access token: $user_info"

                # Step 4: Create Kubernetes secret with the generated PAT
                kubectl create secret generic "$secretName" \
                    --namespace="$secretNamespace" \
                    --from-literal="$secretKeyName=$user_info"

                if [ $? -eq 0 ]; then
                    log_message "Kubernetes secret '$secretName' created successfully in namespace '$secretNamespace'."
                else
                    log_message "Failed to create Kubernetes secret."
                    exit 1
                fi
            }



        create_gitlab_user_token "anotherbot5" "api,read_repository" "gitlab-otherbotbot" "otherbot" "TOKEN"
