# 🏭 UDS GitLab Zarf Package

[![Latest Release](https://img.shields.io/github/v/release/defenseunicorns/uds-package-gitlab)](https://github.com/defenseunicorns/uds-package-gitlab/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/defenseunicorns/uds-package-gitlab/tag-and-release.yaml)](https://github.com/defenseunicorns/uds-package-gitlab/actions/workflows/tag-and-release.yaml)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/defenseunicorns/uds-package-gitlab/badge)](https://api.securityscorecards.dev/projects/github.com/defenseunicorns/uds-package-gitlab)

This package is designed for use as part of a [UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory) bundle deployed on [UDS Core](https://github.com/defenseunicorns/uds-core), and is based on the Bigbang [GitLab](https://repo1.dso.mil/big-bang/product/packages/gitlab) chart.

## Pre-requisites

The GitLab Package expects the pieces listed below to exist in the cluster before being deployed.

#### General

- Create `gitlab` namespace
- Label `gitlab` namespace with `istio-injection: enabled`

#### Database

- A Postgres database is running on port `5432` and accessible to the cluster
- This database can be logged into via the username configured with the zarf var `GITLAB_DB_USERNAME`. Default is `gitlab`
- This database instance has a psql database created matching what is defined in the zarf var `GITLAB_DB_NAME`. Default is `gitlabdb`
- The user has read/write access to the above mentioned database
- Create `gitlab-postgres` service in `gitlab` namespace that points to the psql database
- Create `gitlab-postgres` secret in `gitlab` namespace with the key `password` that contains the password to the user for the psql database

#### Redis / Redis Equivalent

- An instance of Redis or Redis equivalent (elasticache, etc.) is running on port `6379` and accessible to the cluster
- The redis instance accepts anonymous auth (password only)
- Create `gitlab-redis` service in `gitlab` namespace that points to the redis instance
- Create `gitlab-redis` secret in `gitlab` namespace with the key `password` that contains the password to the redis instance

#### Object Storage

Object Storage works a bit differently as there are many kinds of file stores GitLab can be configured to use.

- Create the secret `gitlab-object-store` in the `gitlab` namespace with the following keys:
  - An example for in-cluster Minio can be found in this repository at the path `utils/pkg-deps/gitlab/minio/secret.yaml`
  - `connection`
    - This key refers to the configuration for the main GitLab service. The documentation for what goes in this key is located [here](https://docs.gitlab.com/16.0/ee/administration/object_storage.html#configure-the-connection-settings)
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

## Flavors

| Flavor | Description | Example Creation |
| ------ | ----------- | ---------------- |
| upstream | Uses upstream images within the package. | `zarf package create . -f upstream` |
| registry1 | Uses images from registry1.dso.mil within the package. | `zarf package create . -f registry1` |

> :warning: **Note:** To create the registry1 flavor you will need to be logged into Iron Bank - you can find instructions on how to do this in the [Big Bang Zarf Tutorial](https://docs.zarf.dev/docs/zarf-tutorials/big-bang#setup).

## Releases

The released packages can be found in [ghcr](https://github.com/defenseunicorns/uds-package-gitlab/pkgs/container/packages%2Fuds%2Fgitlab).

## UDS Tasks (for local dev and CI)

*For local dev, this requires you install [uds-cli](https://github.com/defenseunicorns/uds-cli?tab=readme-ov-file#install)

| Task | Description | Example |
| ---- | ----------- | ------- |
| setup-cluster | Uses the `k3d-core-istio` bundle to create a cluster for testing against | `uds run setup-cluster` |
| create-package | Creates just the GitLab package | `uds run create-package --set FLAVOR=<flavor>` |
| create-test-bundle | Creates GitLab and GitLab dependency packages and then bundles them | `uds run create-test-bundle` |
| deploy-test-bundle | Deploy GitLab and GitLab dependency bundle | `uds run deploy-test-bundle` |
| test-package | Run checks against a deployed package | `uds run test-package` |
| cleanup | Teardown the cluster | `uds run cleanup` |
| cleanup-bundle | Remove the GitLab Bundle | `uds run cleanup-bundle` |

## Contributing

Please see the [CONTRIBUTING.md](./CONTRIBUTING.md)
