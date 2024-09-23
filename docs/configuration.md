# Configuration

GitLab in this package is configured through the upstream [GitLab chart](https://docs.gitlab.com/charts/) as well as a UDS configuration chart that supports the following:

## Networking

Network policies are controlled via the `uds-gitlab-config` chart in accordance with the [common patterns for networking within UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory/blob/main/docs/networking.md).  GitLab interacts with GitLab runners, object storage, Redis and Postgresql externally and supports the following keys:

- `storage`: sets network policies for accessing object storage from all GitLab services (`registry`, `pages`, `webservice`, `toolbox`, `sidekiq`)
- `redis`:  sets network policies for accessing a Redis-compatible server from all GitLab services (`webservice`, `toolbox`, `sidekiq`, `migrations`, `gitlab-exporter`)
- `postgres`: sets network policies for accessing a Postgres database from all GitLab services (`webservice`, `toolbox`, `sidekiq`, `migrations`, `gitlab-exporter`)
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

## Redis / Valkey

GitLab uses Redis as a key value store for caching, job queueing and more and supports external providers (such as Elasticache) as well as the [UDS Valkey](https://github.com/defenseunicorns/uds-package-valkey/) package to provide the service.

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
