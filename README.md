# uds-capability-gitlab

Bigbang [Gitlab](https://repo1.dso.mil/big-bang/product/packages/gitlab) deployed via flux by zarf

## Deployment Prerequisites

### GitLab Capability

The Gitlab Capability expects the pieces listed below to exist in the cluster before being deployed.

#### General

- Create `gitlab` namespace
- Label `gitlab` namespace with `istio-injection: enabled`

#### Database

- A Postgres database is running on port `5432` and accessible to the cluster
- This database can be logged into via the username `gitlab`. Use the `GITLAB_DB_USERNAME` zarf variable if that username needs to be changed. default is `gitlab`
- The `gitlab` (or configured `GITLAB_DB_USERNAME`) user has read/write access to the above mentioned database
- Create `gitlab-postgres` service in `gitlab` namespace that points to the psql database
- Create `gitlab-postgres` secret in `gitlab` namespace with the key `password` that contains the password to the `gitlab` user for the psql database

#### Redis / Redis Equivalent

- An instance of Redis or Redis equivalent (elasticache, etc.) is running on port `6379` and accessible to the cluster
- The redis instance accepts anonymous auth (password only)
- Create `gitlab-redis` service in `gitlab` namespace that points to the redis instance
- Create `gitlab-redis` secret in `gitlab` namespace with the key `password` that contains the password to the redis instance

#### Object Storage

Object Storage works a bit differently as there are many kinds of file stores gitlab can be configured to use.

- Create the secret `gitlab-object-store` in the `gitlab` namespace with the following keys:
  - An example for in-cluster Minio can be found in this repository at the path `utils/pkg-deps/gitlab/minio/secret.yaml`
  - `connection`
    - This key refers to the configuration for the main gitlab service. The documentation for what goes in this key is located [here](https://docs.gitlab.com/16.0/ee/administration/object_storage.html#configure-the-connection-settings)
  - `registry`
    - This key refers to the configuration for the gitlab registry. The documentation for what goes in this key is located [here](https://docs.docker.com/registry/configuration/#storage)
  - `backups`
    - This key refers to the configuration for the gitlab-toolbox backup tool. It relies on a program called `s3cmd`. The documentation for what goes in this key is located [here](https://s3tools.org/kb/item14.htm)
- Below are the list of buckets that need to be created before starting GitLab:
  - uds-gitlab-pages
  - uds-gitlab-registry
  - uds-gitlab-lfs
  - uds-gitlab-artifacts
  - uds-gitlab-uploads
  - uds-gitlab-packages
  - uds-gitlab-mr-diffs
  - uds-gitlab-terraform-state
  - uds-gitlab-ci-secure-files
  - uds-gitlab-dependency-proxy
  - uds-gitlab-backups
  - uds-gitlab-tmp
- These buckets can have a suffix applied via the `BUCKET_SUFFIX` zarf variable (e.x. `-some-deployment-name` plus `uds-gitlab-backups` would be `uds-gitlab-backups-some-deployment-name`)

## Deploying

### Deploy Everything

#### Via Makefile and local package

```bash
# This will destroy and create a compatible k3d cluster then it will run make build/all and make deploy/all. Follow the breadcrumbs in the Makefile to see what and how its doing it.
make cluster/full
```

### From GHCR OCI Via Zarf

```bash
zarf package deploy ghcr.io/defenseunicorns/uds-capability/gitlab:0.0.6-amd64
```

## Building

### Use zarf to login to the needed registries i.e. registry1.dso.mil and ghcr.io

```bash
# Download Zarf
make build/zarf

# Login to the registry
set +o history

# registry1.dso.mil (To access registry1 images needed during build time)
export REGISTRY1_USERNAME="YOUR-USERNAME-HERE"
export REGISTRY1_TOKEN="YOUR-TOKEN-HERE"
echo $REGISTRY1_TOKEN | build/zarf tools registry login registry1.dso.mil --username $REGISTRY1_USERNAME --password-stdin

# ghcr.io (If you need to push to GHCR)
export GH_USERNAME="YOUR-USERNAME-HERE"
export GH_TOKEN="YOUR-TOKEN-HERE"
echo $GH_TOKEN | build/zarf tools registry login ghcr.io --username $GH_USERNAME --password-stdin

set -o history
```

### Creating the Package

```bash
make build/uds-capability-gitlab
```

## Documentation

[Identity and Access Management](docs/idam.md)
