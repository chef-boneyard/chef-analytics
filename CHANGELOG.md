# chef-analytics CHANGELOG

This file is used to list changes made in each version of the chef-analytics cookbook.

## v0.2.3 (2016-08-22)

- Fixes Issue [#9](https://github.com/chef-cookbooks/chef-analytics/issues/9)
- set chef_ingredient action to `:install` when an explicit version is found
- added ChefSpec examples
- squash Chef 13 WARN: An attempt was made to change version from :latest to nil
  by calling version(nil).

## v0.2.2 (2016-07-29)

- Increased the chef-ingredient requirement to 0.18.3 to support accepting the EULA

## v0.2.1 (2016-07-29)

- Improved requirements section in the readme and removed HTML table
- Added chef_version to metadata
- Removed Chef 11 compatibility around issues_url and source_url in metadata
- Added supported platforms to the metadata

## v0.2.0 (2016-05-16)

- Added option to pass channel to chef-ingredient
- Added ability to accept EULA via attribute
- Changed package-source attribute to package_source for consistency
- Set default action to upgrade instead of install
- Added gaurd to analytics reconfigure

## v0.1.0

- Initial release of chef-analytics
