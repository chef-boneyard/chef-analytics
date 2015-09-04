#
# Copyright:: Copyright (c) 2012-2015 Chef Software, Inc.
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

chef_ingredient 'analytics' do
  version node['chef-analytics']['version']
  package_source node['chef-analytics']['package_source']
  action :upgrade
end

directory '/etc/opscode-analytics' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

# create the initial chef-server config file
template '/etc/opscode-analytics/opscode-analytics.rb' do
  source 'opscode-analytics.rb.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :reconfigure, 'chef_ingredient[analytics]', :immediately
  only_if { File.exists?('/etc/opscode-analytics/actions-source.json') }
end
