name 'chef-analytics'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs/Configures chef-analytics'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.3'

depends 'chef-ingredient', '>= 0.18.3'

%w(ubuntu redhat centos).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/chef-analytics'
issues_url 'https://github.com/chef-cookbooks/chef-analytics/issues'

chef_version '>= 12.1' if respond_to?(:chef_version)
