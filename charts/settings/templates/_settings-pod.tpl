# Reusable Pod spec for settings jobs
{{- define "uds-gitlab-settings.settings-pod" }}
metadata:
  labels:
    app: gitlab
spec:
  serviceAccountName: gitlab-settings-sa
  containers:
  - name: gitlab-settings
    image: "{{ .Values.global.kubectl.image.repository }}:{{ .Values.global.kubectl.image.tag }}"
    command: ["/bin/sh", "-c"]
    args:
      - |
        # Read the JSON file from the mounted application settings secret
        SETTINGS=$(cat /etc/gitlab-settings/application.json)

        # Dynamically parse each key-value pair in the JSON using yq and construct query parameters
        QUERY_PARAMS=$(echo $SETTINGS | yq e 'to_entries | map("\(.key)=\(.value)") | join("&")' -)

        # Generate and capture a GitLab token from the GitLab Toolbox Rails Console
        TOKEN=$(kubectl exec -n gitlab deployment/gitlab-toolbox -- \
          gitlab-rails runner -e production \
          "random_token = SecureRandom.hex(32); token = User.find_by_username('root').personal_access_tokens.create(scopes: ['api', 'admin_mode'], name: 'Application Settings Token', expires_at: 1.days.from_now); token.set_token(random_token); token.save!; puts random_token" | tail -n 1)
        
        # Use the generated token to set GitLab settings
        kubectl exec -n gitlab deployment/gitlab-toolbox -- \
          curl --request PUT --header "PRIVATE-TOKEN: $TOKEN" \
            "http://gitlab-webservice-default.gitlab.svc.cluster.local:8181/api/v4/application/settings?$QUERY_PARAMS"

        # Revoke the token after use
        kubectl exec -n gitlab deployment/gitlab-toolbox -- \
          gitlab-rails runner -e production \
          "token = PersonalAccessToken.find_by_token('$TOKEN'); token.revoke!"
    volumeMounts:
      - name: gitlab-settings-volume
        mountPath: /etc/gitlab-settings
        readOnly: true
  restartPolicy: OnFailure
  volumes:
  - name: gitlab-settings-volume
    secret:
      secretName: gitlab-settings-secret
{{- end }}
