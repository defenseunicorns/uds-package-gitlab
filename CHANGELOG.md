# Changelog

All notable changes to this project will be documented in this file.

## [17.5.2-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.5.1-uds.2...v17.5.2-uds.0) (2024-11-19)


### Miscellaneous

* **deps:** update gitlab package dependencies ([#233](https://github.com/defenseunicorns/uds-package-gitlab/issues/233)) ([f739a28](https://github.com/defenseunicorns/uds-package-gitlab/commit/f739a28577508ef43bdd3fe98b3959ede4672be9))
* **deps:** update support-deps to v1.3.0 ([#238](https://github.com/defenseunicorns/uds-package-gitlab/issues/238)) ([43b581b](https://github.com/defenseunicorns/uds-package-gitlab/commit/43b581bcd3d4808b13ad4d0b9960f13e8cf77dcc))

## [17.5.1-uds.2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.5.1-uds.1...v17.5.1-uds.2) (2024-11-15)


### Features

* add ability to change default scopes ([#236](https://github.com/defenseunicorns/uds-package-gitlab/issues/236)) ([90080c5](https://github.com/defenseunicorns/uds-package-gitlab/commit/90080c59fb0b2c1808603887e1d41c44037474f8))

## [17.5.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.5.1-uds.0...v17.5.1-uds.1) (2024-11-14)


### ⚠ BREAKING CHANGES

* add object store secret generation ([#229](https://github.com/defenseunicorns/uds-package-gitlab/issues/229))

### Features

* add object store secret generation ([#229](https://github.com/defenseunicorns/uds-package-gitlab/issues/229)) ([e2eb77a](https://github.com/defenseunicorns/uds-package-gitlab/commit/e2eb77af77c58ed423289db761dee43d9e7f82e2))


### Bug Fixes

* add docs and escape hatch for object storage generation ([#234](https://github.com/defenseunicorns/uds-package-gitlab/issues/234)) ([ebb282a](https://github.com/defenseunicorns/uds-package-gitlab/commit/ebb282aacd965c825bcfb847f9b9cbdb4152accd))
* remove rate-limiting from default settings ([#230](https://github.com/defenseunicorns/uds-package-gitlab/issues/230)) ([e78a74d](https://github.com/defenseunicorns/uds-package-gitlab/commit/e78a74d516ac26016521ae5a9d345a34a48642f5))


### Miscellaneous

* update CODEOWNERS file ([#235](https://github.com/defenseunicorns/uds-package-gitlab/issues/235)) ([23778e6](https://github.com/defenseunicorns/uds-package-gitlab/commit/23778e621ff06869adbfd307b5d6dafad948199e))
* update README.md ([#232](https://github.com/defenseunicorns/uds-package-gitlab/issues/232)) ([4b2305c](https://github.com/defenseunicorns/uds-package-gitlab/commit/4b2305c772d7dfef7b07b79d6d26b305d8237e35))

## [17.5.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.3.6-uds.2...v17.5.1-uds.0) (2024-11-05)


### Bug Fixes

* add trusted proxies to properly handle rate limits ([#227](https://github.com/defenseunicorns/uds-package-gitlab/issues/227)) ([8d5c30a](https://github.com/defenseunicorns/uds-package-gitlab/commit/8d5c30a4eefda79ee59931157e1d62bcf9744829))


### Miscellaneous

* **deps:** update gitlab package dependencies ([#222](https://github.com/defenseunicorns/uds-package-gitlab/issues/222)) ([832d263](https://github.com/defenseunicorns/uds-package-gitlab/commit/832d263bb27d6c9595f84683602816ccceb30a15))

## [17.3.6-uds.2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.3.6-uds.1...v17.3.6-uds.2) (2024-11-01)


### Bug Fixes

* add netpol to allow gitaly to perform repository mirroring actions ([#226](https://github.com/defenseunicorns/uds-package-gitlab/issues/226)) ([4e3621a](https://github.com/defenseunicorns/uds-package-gitlab/commit/4e3621abc2abc04bf11ca01faf2f2cce7a958e61))


### Miscellaneous

* **deps:** update gitlab support dependencies ([#215](https://github.com/defenseunicorns/uds-package-gitlab/issues/215)) ([d3adef6](https://github.com/defenseunicorns/uds-package-gitlab/commit/d3adef6a0f2a994fef15622c13ae65934c25788d))
* exclude publishing unicorn flavor arm64 package ([#223](https://github.com/defenseunicorns/uds-package-gitlab/issues/223)) ([4e3974d](https://github.com/defenseunicorns/uds-package-gitlab/commit/4e3974df09286bb1a8924b38b1c3124f1098f9b0))

## [17.3.6-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.3.6-uds.0...v17.3.6-uds.1) (2024-10-28)


### Features

* add unicorn flavor ([#221](https://github.com/defenseunicorns/uds-package-gitlab/issues/221)) ([28aaa13](https://github.com/defenseunicorns/uds-package-gitlab/commit/28aaa1390e14312d32598a6dba23dbe38a48b487))


### Miscellaneous

* fix S2-&gt;S3 in README.md ([#219](https://github.com/defenseunicorns/uds-package-gitlab/issues/219)) ([361c74a](https://github.com/defenseunicorns/uds-package-gitlab/commit/361c74aaf90bfff09e7f233b836c9dbcf0c56785))

## [17.3.6-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.9-uds.0...v17.3.6-uds.0) (2024-10-25)


### Bug Fixes

* made for uds badge url ([#210](https://github.com/defenseunicorns/uds-package-gitlab/issues/210)) ([d086202](https://github.com/defenseunicorns/uds-package-gitlab/commit/d0862027d28302bd55580d35724a2a294d0ed131))


### Miscellaneous

* **deps:** update gitlab package dependencies to v17.3.6 ([#212](https://github.com/defenseunicorns/uds-package-gitlab/issues/212)) ([ec9b792](https://github.com/defenseunicorns/uds-package-gitlab/commit/ec9b7921f1cc6c76f2d71ebb5d64794328841938))
* **deps:** update gitlab support dependencies ([#203](https://github.com/defenseunicorns/uds-package-gitlab/issues/203)) ([979b39f](https://github.com/defenseunicorns/uds-package-gitlab/commit/979b39fb7c3e74b67cfae48bc17a928cde613d05))
* set fail-fast to true on test matrix ([#218](https://github.com/defenseunicorns/uds-package-gitlab/issues/218)) ([301f2e0](https://github.com/defenseunicorns/uds-package-gitlab/commit/301f2e012552211abf1a42d3bfdf3c3aea5e2fc0))
* streamline README and add workflow permissions ([#214](https://github.com/defenseunicorns/uds-package-gitlab/issues/214)) ([9a0629b](https://github.com/defenseunicorns/uds-package-gitlab/commit/9a0629b1edc48b6b3770fb3dec5b3068e5312578))
* update commitlint.yaml permissions ([#216](https://github.com/defenseunicorns/uds-package-gitlab/issues/216)) ([82fc9f5](https://github.com/defenseunicorns/uds-package-gitlab/commit/82fc9f5a515f2a2cecb226f1d6b1aabe0ccf5e53))

## [17.2.9-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.7-uds.2...v17.2.9-uds.0) (2024-10-15)


### Bug Fixes

* validate package with full resource name ([#208](https://github.com/defenseunicorns/uds-package-gitlab/issues/208)) ([3d585c4](https://github.com/defenseunicorns/uds-package-gitlab/commit/3d585c405a5c6ba8a9ab796242a1bbcdc784fd72))


### Miscellaneous

* **deps:** update gitlab package dependencies to 17.2.9 ([#200](https://github.com/defenseunicorns/uds-package-gitlab/issues/200)) ([5b87615](https://github.com/defenseunicorns/uds-package-gitlab/commit/5b87615432505943e8ea959a2ea00f73fba6b818))

## [17.2.7-uds.2](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.7-uds.1...v17.2.7-uds.2) (2024-10-03)


### Features

* add configurable bot accounts and gitlab license ([#206](https://github.com/defenseunicorns/uds-package-gitlab/issues/206)) ([0e22c21](https://github.com/defenseunicorns/uds-package-gitlab/commit/0e22c219f41e54e7f5ccddc15366d0f4eb30d5d9))


### Miscellaneous

* update admin tasks for consistency ([#202](https://github.com/defenseunicorns/uds-package-gitlab/issues/202)) ([b376718](https://github.com/defenseunicorns/uds-package-gitlab/commit/b37671899b5226223e13b829d509363bc124b1cd))

## [17.2.7-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.7-uds.0...v17.2.7-uds.1) (2024-09-24)


### ⚠ BREAKING CHANGES

* allow configurability of SSH and harden application settings ([#196](https://github.com/defenseunicorns/uds-package-gitlab/issues/196))

### Features

* allow configurability of SSH and harden application settings ([#196](https://github.com/defenseunicorns/uds-package-gitlab/issues/196)) ([bcd34c6](https://github.com/defenseunicorns/uds-package-gitlab/commit/bcd34c6e0499c6d00954fb8cb34b6fe6b9a3dcd4))


### Miscellaneous

* **deps:** update gitlab support dependencies ([#191](https://github.com/defenseunicorns/uds-package-gitlab/issues/191)) ([3e90272](https://github.com/defenseunicorns/uds-package-gitlab/commit/3e90272895d69038feb0444bd8f29a83ab9b9f0f))

## [17.2.7-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.5-uds.0...v17.2.7-uds.0) (2024-09-18)


### Miscellaneous

* **deps:** update gitlab package dependencies to 17.2.7 ([#198](https://github.com/defenseunicorns/uds-package-gitlab/issues/198)) ([e509460](https://github.com/defenseunicorns/uds-package-gitlab/commit/e509460cb728aa1020c12e296535ad0f449a79a1))

## [17.2.5-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.4-uds.0...v17.2.5-uds.0) (2024-09-14)


### Miscellaneous

* **deps:** update gitlab package dependencies ([#194](https://github.com/defenseunicorns/uds-package-gitlab/issues/194)) ([ac4aa1c](https://github.com/defenseunicorns/uds-package-gitlab/commit/ac4aa1cd87a341772070ee96c4d161b1cd0ef693))

## [17.2.4-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.2-uds.0...v17.2.4-uds.0) (2024-08-27)


### Miscellaneous

* **deps:** update gitlab package dependencies ([#192](https://github.com/defenseunicorns/uds-package-gitlab/issues/192)) ([feadb39](https://github.com/defenseunicorns/uds-package-gitlab/commit/feadb39541873a9ba35fca4d665abdaf191d17e9))

## [17.2.2-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.2.1-uds.0...v17.2.2-uds.0) (2024-08-13)


### Bug Fixes

* update chart and swap images to fix update ([#188](https://github.com/defenseunicorns/uds-package-gitlab/issues/188)) ([dbd955b](https://github.com/defenseunicorns/uds-package-gitlab/commit/dbd955b9a95a1a25e6f1cd459b8e90f47f677c84))


### Miscellaneous

* **deps:** update gitlab package dependencies ([#182](https://github.com/defenseunicorns/uds-package-gitlab/issues/182)) ([dde48c0](https://github.com/defenseunicorns/uds-package-gitlab/commit/dde48c0657cb64d77a2428cccb7fe2fc74d29961))
* **deps:** update gitlab support dependencies ([#181](https://github.com/defenseunicorns/uds-package-gitlab/issues/181)) ([b14c243](https://github.com/defenseunicorns/uds-package-gitlab/commit/b14c243617a5f55812c517f3652aedb1455eea01))
* move health check into package itself ([#183](https://github.com/defenseunicorns/uds-package-gitlab/issues/183)) ([97b687e](https://github.com/defenseunicorns/uds-package-gitlab/commit/97b687e106cccd132f4da7326da4d4d7247ab9f7))

## [17.2.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.1.2-uds.1...v17.2.1-uds.0) (2024-07-29)


### ⚠ BREAKING CHANGES

* remove egress anywhere for SSO ([#177](https://github.com/defenseunicorns/uds-package-gitlab/issues/177))

### Miscellaneous

* add PeerAuthentication docs and Made for UDS Badge ([#174](https://github.com/defenseunicorns/uds-package-gitlab/issues/174)) ([4909378](https://github.com/defenseunicorns/uds-package-gitlab/commit/49093782822332152dd3e74e7442e8509d1742e9))
* **deps:** update gitlab package dependencies ([#171](https://github.com/defenseunicorns/uds-package-gitlab/issues/171)) ([f9c0081](https://github.com/defenseunicorns/uds-package-gitlab/commit/f9c00818b401d9d792f936a0c726abfd8fd96a77))
* **deps:** update gitlab support dependencies ([#175](https://github.com/defenseunicorns/uds-package-gitlab/issues/175)) ([d7be43a](https://github.com/defenseunicorns/uds-package-gitlab/commit/d7be43a755c8ce44cc0d20c06a51ae090771df5f))
* remove egress anywhere for SSO ([#177](https://github.com/defenseunicorns/uds-package-gitlab/issues/177)) ([996181d](https://github.com/defenseunicorns/uds-package-gitlab/commit/996181dca6784786372ff77e00606c2d66e7fe41))
* swap to `openid-connect` instead of `_` ([#179](https://github.com/defenseunicorns/uds-package-gitlab/issues/179)) ([59e3954](https://github.com/defenseunicorns/uds-package-gitlab/commit/59e3954f36959b32dce0fbc64c591a0b18d05626))

## [17.1.2-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.1.2-uds.0...v17.1.2-uds.1) (2024-07-23)


### Bug Fixes

* add working podmonitor for sidekiq ([#169](https://github.com/defenseunicorns/uds-package-gitlab/issues/169)) ([5ff550a](https://github.com/defenseunicorns/uds-package-gitlab/commit/5ff550a9465720fd102ea5c2badcd5962fef5355))


### Miscellaneous

* change playwright to a docker container ([#172](https://github.com/defenseunicorns/uds-package-gitlab/issues/172)) ([9c805ff](https://github.com/defenseunicorns/uds-package-gitlab/commit/9c805ffd057745e79aa7e89877097efd5ce0d5d2))
* **deps:** update gitlab support dependencies ([#170](https://github.com/defenseunicorns/uds-package-gitlab/issues/170)) ([f02875b](https://github.com/defenseunicorns/uds-package-gitlab/commit/f02875bcd3e0314bf27136bbb6e8de90872891fe))

## [17.1.2-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.1.1-uds.1...v17.1.2-uds.0) (2024-07-18)


### Features

* expose `requiredGroups` in sso config ([#167](https://github.com/defenseunicorns/uds-package-gitlab/issues/167)) ([c0b4c37](https://github.com/defenseunicorns/uds-package-gitlab/commit/c0b4c37940fac22c879dd785405b5012a819e55c))


### Miscellaneous

* **deps:** update gitlab package dependencies ([#163](https://github.com/defenseunicorns/uds-package-gitlab/issues/163)) ([78d5f4d](https://github.com/defenseunicorns/uds-package-gitlab/commit/78d5f4dcabb3ddaaf7cb87761c560c6cdc2b8c1f))
* **deps:** update gitlab support dependencies ([#162](https://github.com/defenseunicorns/uds-package-gitlab/issues/162)) ([0c49973](https://github.com/defenseunicorns/uds-package-gitlab/commit/0c49973a26cfa58026a2e88b0314e33dfe000792))

## [17.1.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.1.1-uds.0...v17.1.1-uds.1) (2024-07-09)


### ⚠ BREAKING CHANGES

* allow redis password secret creation and GitLab PeerAuthentication exceptions ([#161](https://github.com/defenseunicorns/uds-package-gitlab/issues/161))

### Features

* allow redis password secret creation and GitLab PeerAuthentication exceptions ([#161](https://github.com/defenseunicorns/uds-package-gitlab/issues/161)) ([a5e9bd1](https://github.com/defenseunicorns/uds-package-gitlab/commit/a5e9bd1f9c116acbea06b28d78d651dec5f5696d))


### Miscellaneous

* **deps:** update gitlab support dependencies ([#158](https://github.com/defenseunicorns/uds-package-gitlab/issues/158)) ([32aece7](https://github.com/defenseunicorns/uds-package-gitlab/commit/32aece705213305db19b115a2acc74fb3166e20a))
* remove and gitignore .vscode directory ([#159](https://github.com/defenseunicorns/uds-package-gitlab/issues/159)) ([c087596](https://github.com/defenseunicorns/uds-package-gitlab/commit/c087596604d2296ca9d05e915d59d6c715fd90a9))
* update license ([#148](https://github.com/defenseunicorns/uds-package-gitlab/issues/148)) ([a457cc4](https://github.com/defenseunicorns/uds-package-gitlab/commit/a457cc4946be87160e86743e7416a10d69dfaf8c))

## [17.1.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.0.2-uds.0...v17.1.1-uds.0) (2024-06-27)


### Miscellaneous

* **deps:** update gitlab package dependencies ([#156](https://github.com/defenseunicorns/uds-package-gitlab/issues/156)) ([539df77](https://github.com/defenseunicorns/uds-package-gitlab/commit/539df77deb6dcfd98896ccee2bb0d88b2a2d5aa9))
* **deps:** update gitlab support dependencies ([#143](https://github.com/defenseunicorns/uds-package-gitlab/issues/143)) ([1d78bf6](https://github.com/defenseunicorns/uds-package-gitlab/commit/1d78bf6beefa749306a26dbae0a3e1405c560ae8))

## [17.0.2-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.0.1-uds.1...v17.0.2-uds.0) (2024-06-20)


### Features

* add wait for GL package CR readiness ([#144](https://github.com/defenseunicorns/uds-package-gitlab/issues/144)) ([eaa59dd](https://github.com/defenseunicorns/uds-package-gitlab/commit/eaa59ddbe0ebdc6935732b104479f667be588dad))
* allow for Postgres password secret generation ([#147](https://github.com/defenseunicorns/uds-package-gitlab/issues/147)) ([5d48380](https://github.com/defenseunicorns/uds-package-gitlab/commit/5d48380e57b40a66aa8000059f5f5caa1c6e7558))


### Bug Fixes

* add missing exporter netpols ([#142](https://github.com/defenseunicorns/uds-package-gitlab/issues/142)) ([9b5a258](https://github.com/defenseunicorns/uds-package-gitlab/commit/9b5a25876c8ee4432095ea9b94da9072b547f225))


### Miscellaneous

* cache playwright and add tests to amd64 release ([#155](https://github.com/defenseunicorns/uds-package-gitlab/issues/155)) ([4af9d3a](https://github.com/defenseunicorns/uds-package-gitlab/commit/4af9d3a210f4776909db5f3d611840c57a0f44e6))
* **deps:** update gitlab package dependencies ([#154](https://github.com/defenseunicorns/uds-package-gitlab/issues/154)) ([e5a8f66](https://github.com/defenseunicorns/uds-package-gitlab/commit/e5a8f66a66ac635665e298c1ad7c7e9d1bf10223))
* **deps:** update gitlab support dependencies ([#137](https://github.com/defenseunicorns/uds-package-gitlab/issues/137)) ([66bb3ba](https://github.com/defenseunicorns/uds-package-gitlab/commit/66bb3ba7947eb28f8d7764b80495c62b6c6a5937))
* document how to use the database ([#149](https://github.com/defenseunicorns/uds-package-gitlab/issues/149)) ([3ec9044](https://github.com/defenseunicorns/uds-package-gitlab/commit/3ec90445035d1c18f4f06a891861c2a95c6a0af8))

## [17.0.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.0.1-uds.0...v17.0.1-uds.1) (2024-05-24)


### ⚠ BREAKING CHANGES

* add saml sso support as the default ([#118](https://github.com/defenseunicorns/uds-package-gitlab/issues/118)) ([d1bc561](https://github.com/defenseunicorns/uds-package-gitlab/commit/d1bc561baa43165a8267f4fe219f4aa4c96548ca))

> **NOTE:** The above change should convert existing instances from OIDC to SAML seamlessly, but will _require_ UDS Core v0.22.0 or higher.

### Miscellaneous

* **deps:** update support-deps to v37.377.2 ([#134](https://github.com/defenseunicorns/uds-package-gitlab/issues/134)) ([028c3b8](https://github.com/defenseunicorns/uds-package-gitlab/commit/028c3b8c53c073e14db8f2028fceba987b95d66d))

## [17.0.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.11.1-uds.1...v17.0.1-uds.0) (2024-05-24)


### Bug Fixes

* correct `objectStorage` secret Helm value key for toolbox backups ([366c703](https://github.com/defenseunicorns/uds-package-gitlab/commit/366c703a44681a4b4b77f611b77a840c0e3768b5))


### Miscellaneous

* add basic smoke tests with sso, git commit, and file uploads ([#132](https://github.com/defenseunicorns/uds-package-gitlab/issues/132)) ([2c34cf9](https://github.com/defenseunicorns/uds-package-gitlab/commit/2c34cf96803e6bc921574f7024f361dc4b3a3690)), closes [#130](https://github.com/defenseunicorns/uds-package-gitlab/issues/130)
* address prod issues with gitlab ([#131](https://github.com/defenseunicorns/uds-package-gitlab/issues/131)) ([ddea7ff](https://github.com/defenseunicorns/uds-package-gitlab/commit/ddea7ffa0133fd2c44bd358bad31207d123fa6f4))
* cleanup dev secrets to remove postgres refs ([#126](https://github.com/defenseunicorns/uds-package-gitlab/issues/126)) ([430ebba](https://github.com/defenseunicorns/uds-package-gitlab/commit/430ebbae9a7be246f0ade6c8894a32e169a173b6))
* **deps:** update gitlab package dependencies ([#121](https://github.com/defenseunicorns/uds-package-gitlab/issues/121)) ([366c703](https://github.com/defenseunicorns/uds-package-gitlab/commit/366c703a44681a4b4b77f611b77a840c0e3768b5))
* **deps:** update gitlab support dependencies ([#123](https://github.com/defenseunicorns/uds-package-gitlab/issues/123)) ([8ecd5b4](https://github.com/defenseunicorns/uds-package-gitlab/commit/8ecd5b44420d89611f123bd060df4687c90743b1))
* update dev-secrets to use vendored kubectl command ([#129](https://github.com/defenseunicorns/uds-package-gitlab/issues/129)) ([eb7f356](https://github.com/defenseunicorns/uds-package-gitlab/commit/eb7f3569ce79edec1794daf4e2139fea4f07e58f))

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
