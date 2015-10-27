name 'chef-analytics'
maintainer 'Chef Software, Inc.'
maintainer_email 'edavis@chef.io'
license 'Apache 2.0'
description 'Installs/Configures chef-analytics'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'

depends 'chef-ingredient', '>= 0.12.0'

source_url 'https://github.com/chef-cookbooks/chef-analytics' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/chef-analytics/issues' if respond_to?(:issues_url)
