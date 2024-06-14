# Configuration

GitLab in this package is configured through the upstream [GitLab chart](https://docs.gitlab.com/charts/) as well as a UDS configuration chart that supports the following:

## Networking

Network policies are controlled via the `uds-gitlab-config` chart in accordance with the [common patterns for networking within UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory/blob/main/docs/networking.md).  GitLab interacts with GitLab runners, object storage, Redis and Postgresql externally and supports the following keys:

- `storage`: sets network policies for accessing object storage from all GitLab services (`registry`, `pages`, `webservice`, `toolbox`, `sidekiq`)
- `redis`:  sets network policies for accessing a Redis-compatible server from all GitLab services (`webservice`, `toolbox`, `sidekiq`, `migrations`, `gitlab-exporter`)
- `postgres`: sets network policies for accessing a Postgres database from all GitLab services (`webservice`, `toolbox`, `sidekiq`, `migrations`, `gitlab-exporter`)
- `custom`: sets custom network policies for the GitLab namespace - this allows for custom integrations with other services (i.e. Jira)

## Database

GitLab uses Postgres as its backing database service and supports the [common database providers within UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory/blob/main/docs/database.md).  

### Manual Database Connection

If you are using the UDS Postgres Operator or another external database that uses usernames/passwords you can use the following Helm overrides to configure it:

#### `uds-gitlab-config` chart:

> [!IMPORTANT]
> The `postgres.password` setting is not applicable when using the UDS Postgres Operator package or when supplying a secret manually.

- `postgres.password` - provides a password to generate a secret to pass to GitLab


#### `gitlab` chart:

> [!IMPORTANT]
> The `global.psql.password.secret` setting is not applicable when providing a password to the `uds-gitlab-config` chart manually.

- `global.psql.username` - provides the username to use when connecting to the database (i.e. `gitlab.gitlab`)
- `global.psql.password.secret` - provides the secret that contains the database password (i.e. `gitlab.gitlab.pg-cluster.credentials.postgresql.acid.zalan.do`)
- `global.psql.host` - provides the endpoint to use to connect to the database (i.e. `pg-cluster.postgres.svc.cluster.local`)

### IAM Roles for Service Accounts

The Software Factory team has not yet tested IRSA with AWS RDS - there is an open issue linked below with further linked issues to test this that could act as a starting point to implement:

https://github.com/defenseunicorns/uds-software-factory/issues/45
