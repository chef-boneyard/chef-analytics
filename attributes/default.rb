#
# Cookbook:: chef-analytics
# Attributes:: default
#
# Copyright:: 2012-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
default['chef-analytics']['version'] = nil
default['chef-analytics']['package_source'] = nil
default['chef-analytics']['channel'] = :stable

# The Chef Analytics Server must have an API FQDN set.
# https://docs.chef.io/install_analytics.html
default['chef-analytics']['api_fqdn'] = node['fqdn']

# Chef requires agreement to the MLSA
# https://www.chef.io/online-master-agreement/
default['chef-analytics']['accept_license'] = false

#
# Chef Analytics Tunables
#
# For a complete list see:
# https://docs.chef.io/config_rb_analytics.html
# Example:
#
# In a recipe:
#
#   node.override['chef-analytics']['configuration']['nginx']['ssl_port'] = 4433
#
# In a role:
#
#   default_attributes(
#     'chef-analytics' => {
#       'configuration' => {
#         'nginx' => {
#           'ssl_port' => 4433
#         }
#       }
#     }
#   )
#
default['chef-analytics']['configuration'] = {}
