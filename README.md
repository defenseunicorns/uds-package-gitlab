# 🏭 UDS GitLab Zarf Package

[<img alt="Made for UDS" src="https://raw.githubusercontent.com/defenseunicorns/uds-common/refs/heads/main/docs/assets/made-for-uds-silver.svg" height="20px"/>](https://github.com/defenseunicorns/uds-core)
[![Latest Release](https://img.shields.io/github/v/release/defenseunicorns/uds-package-gitlab)](https://github.com/defenseunicorns/uds-package-gitlab/releases)
[![Build Status](https://img.shields.io/github/actions/workflow/status/defenseunicorns/uds-package-gitlab/release.yaml)](https://github.com/defenseunicorns/uds-package-gitlab/actions/workflows/release.yaml)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/defenseunicorns/uds-package-gitlab/badge)](https://api.securityscorecards.dev/projects/github.com/defenseunicorns/uds-package-gitlab)

This package is designed for use as part of a [UDS Software Factory](https://github.com/defenseunicorns/uds-software-factory) bundle deployed on [UDS Core](https://github.com/defenseunicorns/uds-core).
> GitLab is a comprehensive DevOps platform that streamlines the entire software development lifecycle, from planning and source code management to testing, security, and deployment. It offers a unified interface for teams to collaborate effectively and deliver high-quality software efficiently.

> [!IMPORTANT]  
> The `arm64` package includes `amd64` images due to lack of availability of `arm64` images from upstream projects at this time. This means you can deploy the `arm64` package on an `arm64` kubernetes cluster, but some of the images contained in the package will require emulation (e.g., qemu or rosetta) to run properly.

## Pre-requisites

The GitLab Package expects to be deployed on top of [UDS Core](https://github.com/defenseunicorns/uds-core) with a configured Redis/Valkey instance, Postgres database and S3 compatible object storage.  To learn more about configuring GitLab see the [configuration documentation](./docs/configuration.md).

> [!IMPORTANT]
> **NOTE**: Some GitLab features (such as GitLab pages) will also require a [GitLab runner](https://github.com/defenseunicorns/uds-package-gitlab-runner) along with additional configuration such as an additional certificate SAN for `*.pages.<your-domain>`.

## Releases

The released packages can be found in [ghcr](https://github.com/defenseunicorns/uds-package-gitlab/pkgs/container/packages%2Fuds%2Fgitlab).

## UDS Tasks (for local dev and CI)

*For local dev, this requires you install [uds-cli](https://github.com/defenseunicorns/uds-cli?tab=readme-ov-file#install)

> [!TIP]
> To get a list of tasks to run you can use `uds run --list`!

## Contributing

Please see the [CONTRIBUTING.md](./CONTRIBUTING.md)

## Development

When developing this package it is ideal to utilize the json schemas for UDS Bundles, Zarf Packages and Maru Tasks. This involves configuring your IDE to provide schema validation for the respective files used by each application. For guidance on how to set up this schema validation, please refer to the [guide](https://github.com/defenseunicorns/uds-common/blob/main/docs/uds-packages/development/development-ide-configuration.md) in uds-common.
