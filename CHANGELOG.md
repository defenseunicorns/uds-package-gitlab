# Changelog

All notable changes to this project will be documented in this file.

## [16.11.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.11.1-uds.0...v16.11.1-uds.1) (2024-05-07)


### Features

* configure monitoring ([#117](https://github.com/defenseunicorns/uds-package-gitlab/issues/117)) ([423687d](https://github.com/defenseunicorns/uds-package-gitlab/commit/423687db1247969d1f7a3a4fca93fe9d8ae08195))


### Miscellaneous

* add netpol template for runner sandbox ([#125](https://github.com/defenseunicorns/uds-package-gitlab/issues/125)) ([c5ad463](https://github.com/defenseunicorns/uds-package-gitlab/commit/c5ad46310602bce3a09c897923dee8b36f065241))
* **deps:** update gitlab support dependencies ([#114](https://github.com/defenseunicorns/uds-package-gitlab/issues/114)) ([3a3a56b](https://github.com/defenseunicorns/uds-package-gitlab/commit/3a3a56bd79d284e30538f804543e486be7f85c81))

## [16.11.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.10.2-uds.0...v16.11.1-uds.0) (2024-05-02)


### ⚠ BREAKING CHANGES

* sso failing deployment when it is disabled ([#115](https://github.com/defenseunicorns/uds-package-gitlab/issues/115))
* allow [templating of network policies](./docs/networking.md) in the UDS Package ([#110](https://github.com/defenseunicorns/uds-package-gitlab/issues/110))

### Features

* allow [templating of network policies](./docs/networking.md) in the UDS Package ([#110](https://github.com/defenseunicorns/uds-package-gitlab/issues/110)) ([5af09cb](https://github.com/defenseunicorns/uds-package-gitlab/commit/5af09cb47b30a258633bdb4c4d2268df3c9e456d))


### Bug Fixes

* sso failing deployment when it is disabled ([#115](https://github.com/defenseunicorns/uds-package-gitlab/issues/115)) ([8cfdb58](https://github.com/defenseunicorns/uds-package-gitlab/commit/8cfdb58a05f9fe4d652b1ca2060d339660d809e4))


### Miscellaneous

* allow GL pages through istio ([#106](https://github.com/defenseunicorns/uds-package-gitlab/issues/106)) ([9613f76](https://github.com/defenseunicorns/uds-package-gitlab/commit/9613f765ee346a370f1baaa10e0d35779532ca77))
* **deps:** update gitlab package dependencies ([#112](https://github.com/defenseunicorns/uds-package-gitlab/issues/112)) ([a0e2c48](https://github.com/defenseunicorns/uds-package-gitlab/commit/a0e2c48f2f974683e055d1641fb510aa218c8c8e))
* **deps:** update gitlab support dependencies ([#113](https://github.com/defenseunicorns/uds-package-gitlab/issues/113)) ([cde79b3](https://github.com/defenseunicorns/uds-package-gitlab/commit/cde79b313a83c1c24036d6456771eafb60f97ecb))
* **deps:** update gitlab support dependencies ([#99](https://github.com/defenseunicorns/uds-package-gitlab/issues/99)) ([275ccd6](https://github.com/defenseunicorns/uds-package-gitlab/commit/275ccd6e86c3f1ea2d5b8d4f2780e497cedb375e))
* migrate to upstream chart ([#72](https://github.com/defenseunicorns/uds-package-gitlab/issues/72)) ([b0e151e](https://github.com/defenseunicorns/uds-package-gitlab/commit/b0e151e76104cd3130e41cd185d433fd628dcfa0))
* release v16.11.1-uds.0 ([#120](https://github.com/defenseunicorns/uds-package-gitlab/issues/120)) ([5c13d62](https://github.com/defenseunicorns/uds-package-gitlab/commit/5c13d6209aeb9fc8f7ce1da0d3c4ac4f22ae274e))
* switch to new SSO secret template ([#111](https://github.com/defenseunicorns/uds-package-gitlab/issues/111)) ([acf28bc](https://github.com/defenseunicorns/uds-package-gitlab/commit/acf28bc7eccf2cf547a0191fc61d37105486608d))

## [16.10.2-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.10.1-uds.1...v16.10.2-uds.0) (2024-04-15)


### Features

* move to postgres operator chart ([#103](https://github.com/defenseunicorns/uds-package-gitlab/issues/103)) ([afbbc10](https://github.com/defenseunicorns/uds-package-gitlab/commit/afbbc1020cbb06fb41b72289acdbc4b597e7c31d))


### Miscellaneous

* **deps:** update gitlab package dependencies ([#107](https://github.com/defenseunicorns/uds-package-gitlab/issues/107)) ([15cdf38](https://github.com/defenseunicorns/uds-package-gitlab/commit/15cdf387f818e47ef44a751708a7fbffd20ec4e7))

## [16.10.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.10.1-uds.0...v16.10.1-uds.1) (2024-04-01)


### Miscellaneous

* **deps:** update package-deps to v7.10.1-bb.0 ([#100](https://github.com/defenseunicorns/uds-package-gitlab/issues/100)) ([625fde5](https://github.com/defenseunicorns/uds-package-gitlab/commit/625fde509d048fe0ea22939f0b2151caf385cd94))

## [16.10.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.2-uds.4...v16.10.1-uds.0) (2024-03-29)


### Miscellaneous

* add a renovate schedule to reduce paid runner churn ([#91](https://github.com/defenseunicorns/uds-package-gitlab/issues/91)) ([42c2a0c](https://github.com/defenseunicorns/uds-package-gitlab/commit/42c2a0c2178816a6d908147126fb712d8136d978))
* **deps:** update gitlab package dependencies to v16.10.1 ([#89](https://github.com/defenseunicorns/uds-package-gitlab/issues/89)) ([ff385b9](https://github.com/defenseunicorns/uds-package-gitlab/commit/ff385b94641db0767a27d94cc9d025f7edef301a))
* **deps:** update gitlab support dependencies ([#88](https://github.com/defenseunicorns/uds-package-gitlab/issues/88)) ([08047bb](https://github.com/defenseunicorns/uds-package-gitlab/commit/08047bb494f68fa890c709db45b02f317013db44))
* release v16.10.1-uds.0 ([#95](https://github.com/defenseunicorns/uds-package-gitlab/issues/95)) ([390000b](https://github.com/defenseunicorns/uds-package-gitlab/commit/390000bc5a8ae8361d627255bdc5b46598fe0baa))

## [16.9.2-uds.4](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.2-uds.3...v16.9.2-uds.4) (2024-03-20)


### Miscellaneous

* fix quotes on release workflow ([#86](https://github.com/defenseunicorns/uds-package-gitlab/issues/86)) ([227d997](https://github.com/defenseunicorns/uds-package-gitlab/commit/227d9979007b13d52e5b358c3e68c483563816e0))
* update to newer architecture building ([#85](https://github.com/defenseunicorns/uds-package-gitlab/issues/85)) ([e991f75](https://github.com/defenseunicorns/uds-package-gitlab/commit/e991f757d7608ea9d95112b87cb86c37b9ff1bf9))

## [16.9.2-uds.3](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.2-uds.2...v16.9.2-uds.3) (2024-03-20)


### Miscellaneous

* **deps:** update gitlab support dependencies ([#83](https://github.com/defenseunicorns/uds-package-gitlab/issues/83)) ([09919ae](https://github.com/defenseunicorns/uds-package-gitlab/commit/09919ae9530306b3ac6d525518195ff90a86d16d))

## [16.9.2-uds.2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.2-uds.1...v16.9.2-uds.2) (2024-03-20)


### Miscellaneous

* fix the bundle creation for registry1 ([#80](https://github.com/defenseunicorns/uds-package-gitlab/issues/80)) ([f67f1d5](https://github.com/defenseunicorns/uds-package-gitlab/commit/f67f1d514e4eae876e0835ddba15a59a0ce28be7))

## [16.9.2-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.2-uds.0...v16.9.2-uds.1) (2024-03-20)


### Bug Fixes

* enable toolbox egress for rake tasks and other debugging ([#77](https://github.com/defenseunicorns/uds-package-gitlab/issues/77)) ([340f3f2](https://github.com/defenseunicorns/uds-package-gitlab/commit/340f3f2619d0e3b137a662cf18f23365a5e79096))


### Miscellaneous

* add upgrade testing and task cleanups ([#73](https://github.com/defenseunicorns/uds-package-gitlab/issues/73)) ([2af9663](https://github.com/defenseunicorns/uds-package-gitlab/commit/2af966305b47105fd2dbc3e9cf387a275b79d70b))
* **deps:** update gitlab support dependencies ([#71](https://github.com/defenseunicorns/uds-package-gitlab/issues/71)) ([3c46902](https://github.com/defenseunicorns/uds-package-gitlab/commit/3c469028708ef1e53866c08d1b2cd30463714bfb))
* hotfix workflow run rules ([#79](https://github.com/defenseunicorns/uds-package-gitlab/issues/79)) ([81b5501](https://github.com/defenseunicorns/uds-package-gitlab/commit/81b5501f72dcd3a9854fb8f6f3423ac28bd0e047))
* remove renovate encrypted creds now pulled from common ([#69](https://github.com/defenseunicorns/uds-package-gitlab/issues/69)) ([06d44d8](https://github.com/defenseunicorns/uds-package-gitlab/commit/06d44d8b2add8ec3a481129b9948f4fe2fff8818))
* update CODEOWNERS to new style/group ([#74](https://github.com/defenseunicorns/uds-package-gitlab/issues/74)) ([bdd3167](https://github.com/defenseunicorns/uds-package-gitlab/commit/bdd3167d330767b560ed285def15d0bc45ba8825))
* update to the new bundle publish flow ([#76](https://github.com/defenseunicorns/uds-package-gitlab/issues/76)) ([6e0f62d](https://github.com/defenseunicorns/uds-package-gitlab/commit/6e0f62dd9d14f5d8cc8630092df233d7ada48902))

## [16.9.2-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.1-uds.3...v16.9.2-uds.0) (2024-03-13)


### Miscellaneous

* **deps:** update gitlab package dependencies to v16.9.2 ([#59](https://github.com/defenseunicorns/uds-package-gitlab/issues/59)) ([bb52880](https://github.com/defenseunicorns/uds-package-gitlab/commit/bb52880ce3cafbf5f55f3d1e2f4ad11d25dd34ee))
* **deps:** update gitlab support dependencies ([#49](https://github.com/defenseunicorns/uds-package-gitlab/issues/49)) ([47eab00](https://github.com/defenseunicorns/uds-package-gitlab/commit/47eab00047f88c89c970b44545c4160c5bd7d8d4))


## [16.9.1-uds.3](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.1-uds.2...v16.9.1-uds.3) (2024-03-12)


### Miscellaneous

* change to use uds-common pr workflow ([#63](https://github.com/defenseunicorns/uds-package-gitlab/issues/63)) ([1c86b8b](https://github.com/defenseunicorns/uds-package-gitlab/commit/1c86b8bfdbb00573f150d20ea586f455fcb8f379))
* included ci shim ([#64](https://github.com/defenseunicorns/uds-package-gitlab/issues/64)) ([728081f](https://github.com/defenseunicorns/uds-package-gitlab/commit/728081f7dedd6cb014b6855961077ef6b6d15684))

## [16.9.1-uds.2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.1-uds.1...v16.9.1-uds.2) (2024-03-08)


### Features

* implement oidc sso for gitlab ([#61](https://github.com/defenseunicorns/uds-package-gitlab/issues/61)) ([0ddedcf](https://github.com/defenseunicorns/uds-package-gitlab/commit/0ddedcf4ec3fc7a7bb16680f95da18381ecf4c31))

## [16.9.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.9.1-uds.0...v16.9.1-uds.1) (2024-03-05)


### ci

* use uds vendored zarf on publish ([#55](https://github.com/defenseunicorns/uds-package-gitlab/issues/55)) ([4e46674](https://github.com/defenseunicorns/uds-package-gitlab/commit/4e46674abc55062075fdfdf4ef1645f243bed5cd))

## [16.9.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.8.1-uds.4...v16.9.1-uds.0) (2024-03-04)


### ci

* fix ci publish ([#19](https://github.com/defenseunicorns/uds-package-gitlab/issues/19)) ([d1d08db](https://github.com/defenseunicorns/uds-package-gitlab/commit/d1d08db47236ece57d93e2f18eeb7a6dd7db420a))


### Features

* add bucket_prefix ([#45](https://github.com/defenseunicorns/uds-package-gitlab/issues/45)) ([f3680fe](https://github.com/defenseunicorns/uds-package-gitlab/commit/f3680fe71416ee90fb9a713c82ee4133c2bb2b58))


### Bug Fixes

* renovate and linting updates ([#43](https://github.com/defenseunicorns/uds-package-gitlab/issues/43)) ([dfc9319](https://github.com/defenseunicorns/uds-package-gitlab/commit/dfc9319ab0051b55fda8d2a8e0a71df7f7f01198))


### Miscellaneous

* **deps:** update gitlab package dependencies ([#46](https://github.com/defenseunicorns/uds-package-gitlab/issues/46)) ([cf2ffcc](https://github.com/defenseunicorns/uds-package-gitlab/commit/cf2ffcc9eb7b04bf5788c1829e869dfe9148c53a))
* **deps:** update gitlab support dependencies ([#47](https://github.com/defenseunicorns/uds-package-gitlab/issues/47)) ([c2f1e78](https://github.com/defenseunicorns/uds-package-gitlab/commit/c2f1e7842583e6d826f14e04bfa32e9f864f9b5e))
* migrate to uds-common shared actions and workflows ([#41](https://github.com/defenseunicorns/uds-package-gitlab/issues/41)) ([42e1f96](https://github.com/defenseunicorns/uds-package-gitlab/commit/42e1f96de45381d514ff475715a3f7d301c24c37))


## [16.8.1-uds.4](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.8.1-uds.3...v16.8.1-uds.4) (2024-02-14)


### Bug Fixes

* outdated uds version and missing set value resulting in broken release pipeline ([#36](https://github.com/defenseunicorns/uds-package-gitlab/issues/36)) ([1f9b550](https://github.com/defenseunicorns/uds-package-gitlab/commit/1f9b550c55484aada5b870794ba4420c3fb99035))

## [16.8.1-uds.3](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.8.1-uds.2...v16.8.1-uds.3) (2024-02-14)


### Bug Fixes

* standardize repo to template and update README.md ([#24](https://github.com/defenseunicorns/uds-package-gitlab/issues/24)) ([9815bb5](https://github.com/defenseunicorns/uds-package-gitlab/commit/9815bb583140ad2b828e84d8766c9d483b5a24e6))
* remove hardcoded architecture in zarf packages ([#29](https://github.com/defenseunicorns/uds-package-gitlab/issues/29)) ([2c4e869](https://github.com/defenseunicorns/uds-package-gitlab/commit/2c4e869cccffe63001621d7c77199035e6082032))

## [16.8.1-uds.2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.8.1-uds.1...v16.8.1-uds.2) (2024-01-30)


### ci

* fix ci publish ([#19](https://github.com/defenseunicorns/uds-package-gitlab/issues/19)) ([d1d08db](https://github.com/defenseunicorns/uds-package-gitlab/commit/d1d08db47236ece57d93e2f18eeb7a6dd7db420a))

## [16.8.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.5.1-uds.4...v16.8.1-uds.1) (2024-01-30)


### Miscellaneous

* add uds package for gitlab ([#14](https://github.com/defenseunicorns/uds-package-gitlab/issues/14)) ([2d69707](https://github.com/defenseunicorns/uds-package-gitlab/commit/2d69707065cab0ad8ebbbdd14d847a3b86b94a35))

## [16.5.1-uds.4](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.5.1-uds.3...v16.5.1-uds.4) (2024-01-22)


### Bug Fixes

* release using updated version strategy ([01f18e2](https://github.com/defenseunicorns/uds-package-gitlab/commit/01f18e2bbb7b2cf66452afb8a30bb3dbe6fed00e))

## [16.5.1-3](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.5.1-2...v16.5.1-3) (2024-01-05)


### Bug Fixes

* uds config in task ([fe98d76](https://github.com/defenseunicorns/uds-package-gitlab/commit/fe98d76fa353680ecb91770ecf18c3a9f3540c39))


### Miscellaneous

* begin surgery ([79b8809](https://github.com/defenseunicorns/uds-package-gitlab/commit/79b8809da0df8addf9994866ae4b8d026d4bb911))
* uds version, service cleanup ([8674532](https://github.com/defenseunicorns/uds-package-gitlab/commit/8674532f88adfac54767410de56fe1392bc6f2d0))

## [16.5.1-2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.5.1-1...v16.5.1-2) (2023-12-18)


### Bug Fixes

* login to registry1 for publishing ([7f02afa](https://github.com/defenseunicorns/uds-package-gitlab/commit/7f02afa3ba9539549e925b934df4f7886b1b1475))

## [16.5.1-1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.5.1-0...v16.5.1-1) (2023-12-18)


### Bug Fixes

* add missing release-please files ([61ab941](https://github.com/defenseunicorns/uds-package-gitlab/commit/61ab9412466aa8aa19cbbd5adebb5d0d58e846f5))
* add missing versioning file ([50e971f](https://github.com/defenseunicorns/uds-package-gitlab/commit/50e971f3da7438f7362889858a23b18b06112d70))
* prerelease versioning ([665b319](https://github.com/defenseunicorns/uds-package-gitlab/commit/665b319f3a3e7c0a1accfea795dfa7f795c65a7d))


### Miscellaneous

* upgrade release please to v4.0.1 ([2508890](https://github.com/defenseunicorns/uds-package-gitlab/commit/25088905c608aa241d49336ff7396de631388ea0))

## [0.0.0] - 2023-08-22
PRE RELEASE

### Added
- Initial CHANGELOG.md
- CONTRIBUTING.md
- CODEOWNERS
