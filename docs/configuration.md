# Configuration

GitLab in this package is configured through the upstream [GitLab chart](https://docs.gitlab.com/charts/) as well as a UDS configuration chart that supports the following:

## GitLab License

#### `uds-gitlab-config` chart:

- `license` - Set this to the contents of a GitLab license file to enable GitLab Premium or Ultimate.

## Networking

Network policies are controlled via the `uds-gitlab-config` chart in accordance with the [common patterns for networking within UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory/blob/main/docs/networking.md).  GitLab interacts with GitLab runners, object storage, Redis and Postgresql externally and supports the following keys:

- `storage`: sets network policies for accessing object storage from all GitLab services (`registry`, `pages`, `webservice`, `toolbox`, `sidekiq`)
- `redis`:  sets network policies for accessing a Redis-compatible server from all GitLab services (`webservice`, `toolbox`, `sidekiq`, `migrations`, `gitlab-exporter`)
- `postgres`: sets network policies for accessing a Postgres database from all GitLab services (`webservice`, `toolbox`, `sidekiq`, `migrations`, `gitlab-exporter`)
- `mirroring`: sets network policies that allow the gitlab repository mirroring feature to work. It defaults to only `https` (443) but can be set to allow the other protocols gitlab supports via the `ports` key.
- `custom`: sets custom network policies for the GitLab namespace - this allows for custom integrations with other services (i.e. Jira)

> [!NOTE]
> Currently the GitLab UDS Package contains Istio `PeerAuthentication` exceptions to allow the `dependency` init containers to reach out and check the Redis and Postgres services.  These are only added with `redis.internal` or `postgres.internal` set to `true` and will be removed once UDS Core [switches to native sidecars](https://github.com/defenseunicorns/uds-core/issues/536).

## Database

GitLab uses Postgres as its backing database service and supports the [common database providers within UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory/blob/main/docs/database.md).  

### Manual Database Connection

If you are using the [UDS Postgres Operator](https://github.com/defenseunicorns/uds-package-postgres-operator/) or another external database that uses usernames/passwords you can use the following Helm overrides to configure it:

#### `uds-gitlab-config` chart:

> [!IMPORTANT]
> The `postgres.password` setting is not applicable when using the UDS Postgres Operator package or when supplying a secret manually!

- `postgres.password` - provides a password to generate a secret to pass to GitLab


#### `gitlab` chart:

> [!IMPORTANT]
> The `global.psql.password.secret` and `global.psql.password.key` settings are not applicable when providing a password to the `uds-gitlab-config` chart manually.

- `global.psql.username` - provides the username to use when connecting to the database (i.e. `gitlab.gitlab`)
- `global.psql.password.secret` - provides the secret that contains the database password (defaults to `gitlab-postgres`)
- `global.psql.password.key` - provides the secret key that contains the database password (defaults to `password`)
- `global.psql.host` - provides the endpoint to use to connect to the database (i.e. `pg-cluster.postgres.svc.cluster.local`)
- `global.psql.port` - provides the port to use to connect to the database (defaults to `5432`)

### IAM Roles for Service Accounts

The Software Factory team has not yet tested IRSA with AWS RDS - there is an open issue linked below with further linked issues to test this that could act as a starting point to implement:

https://github.com/defenseunicorns/uds-software-factory/issues/45

## Object Storage

Object Storage works a bit differently as there are many kinds of file stores GitLab can be configured to use. As part of this package, there is a helper to generate the object storage secret required by GitLab based on providing some value overrides to the config chart. 

Below are the list of buckets that need to be created before starting GitLab:

```yaml
  - gitlab-pages
  - gitlab-registry
  - gitlab-lfs
  - gitlab-artifacts
  - gitlab-uploads
  - gitlab-packages
  - gitlab-mr-diffs
  - gitlab-terraform-state
  - gitlab-ci-secure-files
  - gitlab-dependency-proxy
  - gitlab-backups
  - gitlab-tmp
```

> [!NOTE] 
> These buckets can have a prefix or suffix applied via the `BUCKET_PREFIX` and `BUCKET_SUFFIX` Zarf variables (e.g. a prefix of `uds-` and a suffix of `-some-deployment-name` plus `gitlab-backups` would be `uds-gitlab-backups-some-deployment-name`)

By default, the application is configured to work with `uds-package-minio-operator` package, adding [these overrides](https://github.com/defenseunicorns/uds-package-gitlab/blob/e2eb77af77c58ed423289db761dee43d9e7f82e2/bundle/uds-bundle.yaml#L18-L45) to the operator to provision the object storage required by GitLab.

If you are not using in-cluster MinIO, but rather are using an external cloud providers object storage, you have two options. You can either create an object storage secret manually and disable the generation of the secret or have the helm chart generate one for you based on a set of input values. 

> [!NOTE] 
> If you would like to opt out of the in-chart secret generation process, you may disable it by setting the zarf variable `GENERATE_STORAGE_SECRET` to false. Then you can provide your own object store secret, named `gitlab-object-store`, as needed following GitLab's documentation.

When configuring the GitLab to connect to S3 storage in AWS, it is assumed IRSA will be used to connect to the buckets. The prerequisites for this are the buckets created with the appropriate iam roles and policies. Once those are created, two values need to be overridden in the config chart for secret generation: `storage.createSecret.provider` needs to be set to `aws` and `storage.createSecret.region` needs to be set to your AWS regions (i.e `us-gov-west-1`). From there, additional overrides are required in the gitlab chart to finish this setup. Specifically, the gitlab service accounts need to be overridden to have the annotations that are required for IRSA. Below is an example of how you would define the variable overrides where you would then pass in the IAM role ARNs on deploy.

```yaml
        gitlab:
          variables:
            - name: REGISTRY_ROLE_ARN
              description: "The ARN of the role to assume for the registry pods"
              path: registry.serviceAccount.annotations.irsa/role-arn
            - name: SIDEKIQ_ROLE_ARN
              description: "The ARN of the role to assume for the sidekiq pods"
              path: gitlab.sidekiq.serviceAccount.annotations.irsa/role-arn
            - name: WEBSERVICE_ROLE_ARN
              description: "The ARN of the role to assume for the web service pods"
              path: gitlab.webservice.serviceAccount.annotations.irsa/role-arn
            - name: TOOLBOX_ROLE_ARN
              description: "The ARN of the role to assume for the toolbox pods"
              path: gitlab.toolbox.serviceAccount.annotations.irsa/role-arn
            - name: PAGES_ROLE_ARN
              description: "The ARN of the role to assume for the pages pods"
              path: gitlab.gitlab-pages.serviceAccount.annotations.irsa/role-arn
```

With this override definition one can then provide the IAM role ARNs to the deployment via either `--set` variables or via a `uds-config.yaml`.

## Redis / Valkey

GitLab uses Redis as a key value store for caching, job queueing and more and supports external providers (such as Elasticache) as well as the [UDS Valkey](https://github.com/defenseunicorns/uds-package-valkey/) package to provide the service.

### Valkey HA Configuration

The [Valkey UDS Package](https://github.com/defenseunicorns/uds-package-valkey) supports the HA replicated architecture ([as of v8.0.1-uds.1](https://github.com/defenseunicorns/uds-package-valkey/releases/tag/v8.0.1-uds.1)) where there is one write node (called a primary), multiple read nodes, and sentinels as side-cars who will elect a new primary in the event the existing primary goes down.
This configuration is further [documented in the Valkey repo](https://github.com/defenseunicorns/uds-package-valkey/blob/main/docs/configuration.md#high-availability). All configuration changes required to connect an HA Valkey to GitLab will be performed at the _bundle_ level. To connect the HA Valkey to Gitlab:

1. Perform the [configuration changes](https://github.com/defenseunicorns/uds-package-valkey/blob/main/docs/configuration.md#configuration-changes) to configure the Valkey Package to deploy an HA instance in your bundle.

2. Change the `global.redis.host` value to be the _name_ of the primary node's role. By default, that is `mymaster`. This value is no longer to be the address for redis.

> [!WARNING]
> This may seem unintuitive until you consider that GitLab will be using the sentinel to find the redis address, but needs to know the name of the primary's role.  This value is still key info required in finding the redis host, but the value ends up _not_ being the redis host address.

  ```yaml
  packages:
    - name: gitlab
      overrides:
        gitlab:
          gitlab:
            values:
              - path: global.redis.host
                value: mymaster
  ```

3. _At the bundle level_, override the `global.redis.sentinels` path in the GitLab chart with a list of the valkey sentinel headless addresses, shown below.

```yaml
packages:
  - name: gitlab
    overrides:
      gitlab:
        gitlab:
          values:
            # See https://docs.gitlab.com/charts/charts/globals.html#redis-sentinel-support
            # for more details on this section of GitLab's chart.
            - path: global.redis.sentinels
              value:
                - host: valkey-node-0.valkey-headless.<valkey namespace>.svc.cluster.local
                  port: 26379
                - host: valkey-node-1.valkey-headless.<valkey namespace>.svc.cluster.local
                  port: 26379
                - host: valkey-node-2.valkey-headless.<valkey namespace>.svc.cluster.local
                  port: 26379
```

4. Set `redis.sentinel.enabled` to `true` in `uds-gitlab-config` chart. This will cause the GitLab UDS Package to include add network policies allowing the GitLab services to access the sentinel's port in addition to the read/write ports.

```yaml
packages:
  - name: gitlab
    overrides:
      gitlab:
        uds-gitlab-config:
          values:
            - path: redis.sentinel.enabled
              value: true
```

5. Make sure GitLab and Valkey agree on whether auth is required for normal valkey, and whether authentication is required for the sentinel.

```yaml
# The values in the valkey chart
packages:
  - name: valkey
    overrides:
      valkey:
        valkey:
          namespace: gitlab-valkey
          values:
            - path: auth.enabled
              value: true
            - path: auth.sentinel
              value: true
  - name: gitlab
    overrides:
      gitlab:
        gitlab:
          values:
            - path: global.redis.auth.enabled
              value: true
            - path: global.redis.sentinelAuth.enabled
              value: true
```

### Manual Keystore Connection

You can use the following Helm overrides to configure a connection to Redis / Valkey:

#### `uds-gitlab-config` chart:

> [!IMPORTANT]
> The `redis.password` setting is not applicable when using the UDS Valkey package or when supplying a secret manually!

- `redis.password` - provides a password to generate a secret to pass to GitLab

#### `gitlab` chart:

> [!IMPORTANT]
> The `global.redis.auth.secret` and `global.redis.auth.key` settings are not applicable when providing a password to the `uds-gitlab-config` chart manually.

- `global.redis.auth.secret` - provides the secret that contains the key value store password (defaults to `gitlab-redis`)
- `global.redis.auth.key` - provides the key within the secret that contains the key value store password (defaults to `password`)
- `global.redis.scheme` - provides the scheme to use to connect to the key value store (i.e. `redis` or `rediss`)
- `global.redis.host` - provides the endpoint to use to connect to the key value store (i.e. `pg-cluster.postgres.svc.cluster.local`)
- `global.redis.port` - provides the port to use to connect to the key value store (defaults to `6379`)

## Configuring SSH

By default this package deploys GitLab in an HTTPS-only mode - this reduces the attack surface by removing one potential point of ingress, but if you need to enable SSH git cloning and have mitigated this risk in other ways you can do so with the following overrides:

#### `uds-core` package:

Before configuring the GitLab package to allow SSH traffic you will need to also allow the traffic through UDS Core (and everything before it).  To configure UDS Core to pass through SSH you will need to add the following (where `2222` is replaced with your chosen SSH port):

```yaml
    overrides:
      istio-tenant-gateway:
        gateway:
          values:
            - path: "service.ports"
              value:
                - name: status-port
                  port: 15021
                  protocol: TCP
                  targetPort: 15021
                - name: http2
                  port: 80
                  protocol: TCP
                  targetPort: 80
                - name: https
                  port: 443
                  protocol: TCP
                  targetPort: 443
                - name: tcp-ssh
                  port: 2222
                  protocol: TCP
                  targetPort: 2222
```

This will allow SSH traffic to traverse the LoadBalancer and hit the Istio Gateway that is configured in the GitLab chart.

#### `uds-gitlab-config` chart:

- `ssh.enabled` - set this to `true` to enable the additional gateway and virtual service
- `ssh.port` - set this to a different integer if you'd like to expose ssh over a different port (defaults to `2222`)

#### `gitlab` chart:

- `gitlab.gitlab-shell.enabled` - set this to `true` to enable the SSH daemon within the GitLab deployment
- `global.shell.port` - set this if you overrode `ssh.port` above to correct the port for the `gitlab-shell` service and the UI (defaults to `2222`)

#### `uds-gitlab-settings` chart:

- `settingsJob.application.enabled_git_access_protocol` - set this to `all` to reenable the SSH option when selecting a repository's clone dropdown

## Configuring GitLab Settings

This package contains an additional chart that will force GitLab application settings to take the values recommended in the [GitLab Application Hardening Recommendations](https://docs.gitlab.com/ee/security/hardening_application_recommendations.html) guide.  These settings may need to be modified for your instance or you may wish to make tweaks to add additional settings that can be found in the [GitLab Application Settings documentation](https://docs.gitlab.com/ee/api/settings.html).

It is recommended to inspect these settings and further lock them down for your specific environment if you are able.  You can change or add settings by adding your desired key to the `settingsJob.application` value of the `uds-gitlab-settings` chart.  This YAML object will be converted to a JSON object and then into query parameters to pass to the [GitLab Application Settings API](https://docs.gitlab.com/ee/api/settings.html).

> [!IMPORTANT]
> Simple key-value pairs can be set as-is, however objects/arrays should be set to the values that would be expected as a query parameter.  As an example, `{"restricted_visibility_levels": ["public"]}` becomes `restricted_visibility_levels: public` in the YAML object.

> [!TIP]
> If you wish to disable the settings Job and CronJob and keep GitLab's default application settings you can do so with the `settingsJob.enabled` value.  You can also adjust the CronJob schedule (when it will reset the application settings) with the `settingsJob.schedule` value.

> [!IMPORTANT]
> [GitLab's Application Hardening Recommendations](https://docs.gitlab.com/ee/security/hardening_application_recommendations.html) guide recommends setting rate limits for various request types however in this package these are disabled by default.  This is because UDS Core does not by default pass the real IP of the client down to the GitLab Pod.  If you need this functionality you must make the following overrides:
>
> `uds-core/istio-passthrough-gateway/gateway`
> ```yaml
> service:
>   externalTrafficPolicy: Local
> ```
>
> `uds-package-gitlab/gitlab/uds-gitlab-settings`
> ```yaml
> settingsJob:
>   application:
>     throttle_authenticated_api_enabled: true
>     throttle_authenticated_packages_api_enabled: true
>     throttle_authenticated_web_enabled: true
>     throttle_unauthenticated_api_enabled: true
>     throttle_unauthenticated_packages_api_enabled: true
>     throttle_unauthenticated_web_enabled: true
> ```
>
> Also note this configuration may become default but as of now is not fully supported and is pending further testing.

## Configuring Bot Accounts

#### `uds-gitlab-config` chart:

- `botAccounts.enabled` - set this to true to enable bot accounts.
- `botAccounts.accounts` - set this to a list of bot accounts to create. If specified, each account will be created in GitLab with the given `username` and `scopes`. A GitLab Personal Access Token (PAT) will be created for the account and stored in the secret specified by `secret.name`, `secret.namespace`, and `secret.keyName`. Any namespaces specified in `botAccounts` secrets will be created automatically.

Example:

```yaml
  - username: renovatebot
    scopes:
      - api
      - read_repository
      - write_repository
    secret:
      name: gitlab-renovate
      namespace: renovate
      keyName: TOKEN
```

This will configure a bot account named `renovatebot` and create a PAT with scopes `api`, `read_repository`, and `write_repository` for the account. The value of the PAT will be stored in the key `TOKEN` in a secret `gitlab-renovate` in the `renovate` namespace.

> [!NOTE]
> If the GitLab instance is configured with a license for Premium or Ultimate, [Gitlab Service Accounts](https://docs.gitlab.com/ee/user/profile/service_accounts.html) will be created. Otherwise, standard user accounts will be created.


## Gitaly HA

To use [custom cgroup sizes for Gitaly](https://docs.gitlab.com/ee/administration/gitaly/kubernetes.html#constrain-git-processes-resource-usage):

1. Set `gitlab.gitaly.cgroups.enabled` to `true` in the `gitlab` chart.
2. Set the cgroup permissions under the pod's resource limits as shown in the [GitLab docs](https://docs.gitlab.com/ee/administration/gitaly/kubernetes.html#constrain-git-processes-resource-usage).
3. Set `gitaly-cgroups-init.enabled` to `true` in the `uds-gitlab-config` chart. This causes a policy exemption to be created allowing the init container privileged access to the host nodes, required to customize the cgroups.

> [!NOTE]
> Only the `upstream` and `unicorn` flavors include the Gitaly init container required for this configuration. It will not work if using the `registry1` flavor.
