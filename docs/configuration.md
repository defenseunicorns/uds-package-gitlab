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

`uds-gitlab-config` chart:
- `postgres.password` - provides a password to generate a secret to pass to GitLab

> [!IMPORTANT]
> The password setting is not applicable when using the UDS Postgres Operator package or when supplying a secret manually.

`gitlab` chart:
- `global.psql.username` - provides the username to use when connecting to the database (i.e. `gitlab.gitlab`)
- `global.psql.password.secret` - provides the secret that contains the database password (i.e. `gitlab.gitlab.pg-cluster.credentials.postgresql.acid.zalan.do`)
- `global.psql.host` - provides the endpoint to use to connect to the database (i.e. `pg-cluster.postgres.svc.cluster.local`)

> [!IMPORTANT]
> The secret setting is not applicable when providing a password to the `uds-gitlab-config` chart manually.

### IAM Roles for Service Accounts

In order to provide a connection to a database via IRSA you must enable IRSA in GitLab as well as annotate the Service Accounts corresponding to the GitLab services that will use the database:

`gitlab` chart:
- `gitlab.sidekiq.serviceAccount.annotations.irsa/role-arn` - sets the ARN of the role for the `sidekiq` service
- `gitlab.webservice.serviceAccount.annotations.irsa/role-arn` - sets the ARN of the role for the `webservice` service
- `gitlab.toolbox.serviceAccount.annotations.irsa/role-arn` - sets the ARN of the role for the `toolbox` service
- `gitlab.migrations.serviceAccount.annotations.irsa/role-arn` - sets the ARN of the role for the `migrations` service
- `gitlab.gitlab-exporter.serviceAccount.annotations.irsa/role-arn` - sets the ARN of the role for the `gitlab-exporter` service

> [!TIP]
> For more information on how GitLab interacts with databases through its Helm chart see the [GitLab documentation on connecting to external databases](https://gitlab.com/gitlab-org/charts/gitlab/-/tree/master/doc/advanced/external-db).
