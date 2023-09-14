# IDAM integration with uds-capability-gitlab

This gitlab capability is preconfigured to work with an IDAM solution, but IDAM is disabled by default.

## IDAM Variables

These Zarf variables are mapped to gitlab helm chart values that are documented [here.](https://docs.gitlab.com/charts/charts/globals#omniauth)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| IDAM_ENABLED | bool | `false` | Enables/disables IDAM |
| IDAM_ALLOWED_SSOS | list | `[]` | Enables auto creation of accounts when signing in with OmniAuth |
| IDAM_BLOCK_AUTO_USERS | bool | `false` | Enables/disables auto created users being blocked by default |
| IDAM_AUTO_LINK_USER | string | `""` | Allows users authenticating via an OmniAuth provider to be automatically linked to a current GitLab user |
| IDAM_AUTO_SIGNIN | string | `""` | Single provider name allowed to automatically sign in |
| IDAM_EXTERNAL_PROVIDERS | list | `[]` | Define which OmniAuth providers you want to be external |
| IDAM_PROVIDERS | multi-line list | `[]` | [See documentation](https://docs.gitlab.com/charts/charts/globals#providers) |
| IDAM_SYNC_ATTRIBUTES | list | `[]` | List of profile attributes to sync from the provider upon login |
| IDAM_SYNC_PROVIDERS | list | `[]` | List of provider names that GitLab should automatically sync profile information from |
