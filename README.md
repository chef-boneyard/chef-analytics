# chef-analytics Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/chef-analytics.svg?branch=master)](https://travis-ci.org/chef-cookbooks/chef-analytics) [![Cookbook Version](https://img.shields.io/cookbook/v/chef-analytics.svg)](https://supermarket.chef.io/cookbooks/chef-analytics)

This cookbook configures a system to be a standalone Chef Analytics Server. It will install the appropriate platform-specific opscode-analytics Omnibus package from Package Cloud and perform the initial configuration.

## Requirements

### Platforms

- Ubuntu 12.04/14.04
- RHEL 6/7

### Chef

- Chef 12.1+

### Cookbooks

- chef-ingredient cookbook

### Misc

This cookbook will also not properly install analytics unless you have copied actions-source.json into /etc/opscode-analytics from your chef-server.

## Attributes

### chef-analytics::default

Key                                  | Type    | Description                                                                                         | Default
------------------------------------ | ------- | --------------------------------------------------------------------------------------------------- | ------------
['chef-analytics']['version']        | String  | What version of analytics to install                                                                | nil
['chef-analytics']['package_source'] | String  | Anything other than package cloud                                                                   | nil
['chef-analytics']['api_fqdn']       | String  | FQDN of host                                                                                        | node['fqdn']
['chef-analytics']['configuration']  | Hash    | Arbitrary config to add to opscode-analytics.rb                                                     | {}
['chef-analytics']['accept_license'] | Boolean | Boolean value indicating you agree to the [Chef MLSA](https://www.chef.io/online-master-agreement/) | false

## Usage

### chef-analytics::default

Add chef-analytics to your run list.

## License and Authors

- Author: Elliott Davis [edavis@chef.io](mailto:edavis@chef.io)
- Copyright 2012-2016, Chef Software, Inc

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
