chef-analytics Cookbook
=======================
This cookbook configures a system to be a *AIO* Chef Analytics Server. It
will install the appropriate platform-specific opscode-analytics Omnibus
package from Package Cloud and perform the initial configuration.


Requirements
------------
This cookbook is tested with  Chef (client) 12. It may work with or
without modification on earlier versions of Chef, but Chef 12 is
recommended.

## Cookbooks

* chef-server-ingredient cookbook
* chef-server cookbook

## Platform

This cookbook is tested on the following platforms using the
[Test Kitchen](http://kitchen.ci) `.kitchen.yml` in the repository.

- Ubuntu 12.04 64-bit

Attributes
----------

#### chef-analytics::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-analytics']['version']</tt></td>
    <td>String</td>
    <td>What version of analytics to install</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-analytics']['package-source']</tt></td>
    <td>String</td>
    <td>Anything other than package cloud</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-analytics']['api_fqdn']</tt></td>
    <td>String</td>
    <td>FQDN of host</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-analytics']['standalone']</tt></td>
    <td>Boolean</td>
    <td>Standalone or AIO Version</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-analytics']['configuration']</tt></td>
    <td>Hash</td>
    <td>Arbitrary config to add to opscode-analytics.rb</td>
    <td><tt>{}</tt></td>
  </tr>
</table>

Usage
-----
#### chef-analytics::default

The easiest way to get a Chef Analytics Server up and running is to install
chef-solo (via the chef-client Omnibus packages) and bootstrap the
system using this cookbook:


    # install chef-solo
    curl -L https://www.chef.io/chef/install.sh | sudo bash
    # create required bootstrap dirs/files
    sudo mkdir -p /var/chef/cache /var/chef/cookbooks
    # pull down this chef-server cookbook
    wget -qO- https://supermarket.chef.io/cookbooks/chef-server/download | sudo tar xvzC /var/chef/cookbooks
    # pull down dependency cookbooks
    wget -qO- https://supermarket.chef.io/cookbooks/chef-server-ingredient/download | sudo tar xvzC /var/chef/cookbooks
    wget -qO- https://supermarket.chef.io/cookbooks/packagecloud/download | sudo tar xvzC /var/chef/cookbooks
    # GO GO GO!!!
    sudo chef-solo -o 'recipe[chef-server::default]'

Be sure to download and untar the `chef-server-ingredient` and
`packagecloud` cookbooks. They're dependencies of this cookbook.


# License and Authors

* Author: Elliott Davis <edavis@chef.io>
* Copyright 2012-2015, Chef Software, Inc

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
```
