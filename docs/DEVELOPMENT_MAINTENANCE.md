# UDS Capability Gitlab

## How to upgrade this capability

<!-- TODO: (@WSTARR) Update these instructions -->

This package is pulling in the [bigbang gitlab chart](https://repo1.dso.mil/big-bang/product/packages/gitlab)

The [gitlab-flux-values.yaml](../gitlab-flux-values.yaml) file contains values used when creating the flux resources for this capability. This includes the version of the chart and the base values used for this capability.

To upgrade
1) Point `application.ref.tag` to the updated version of the chart.
1) Update any base values if necessary.
1) Update the `gitlab` component in the [zarf.yaml](../zarf.yaml) file to pull in the correct images needed for the updated version of the chart.

## How to test this package locally

Prerequisites:
- Docker
- latest version of UDS CLI
- K3d

Note: If developing on an Apple Silicon Mac, colima is an excellent option. If using colima, the following command will provision a VM that should be adequate to deploy this package:  

`colima start --cpu 8 --memory 25 --disk 50 --vm-type vz  --vz-rosetta --profile uds --arch aarch64`

 1) From the root of the repository run `uds run`. To test a specific package flavor, specify that via the --set flag. For example: `uds run --set FLAVOR=upstream`
