module ChefAnalyticsCookbook
  module Helpers
    def api_fqdn_available?
      return false if node['chef-analytics'].nil?
      return false if node['chef-analytics']['api_fqdn'].nil?
      !node['chef-analytics']['api_fqdn'].empty?
    end

    def api_fqdn_resolves?
      ChefIngredientCookbook::Helpers.fqdn_resolves?(
        node['chef-analytics']['api_fqdn']
      )
    end

    def repair_api_fqdn
      fe = Chef::Util::FileEdit.new('/etc/hosts')
      fe.insert_line_if_no_match(/#{node['chef-analytics']['api_fqdn']}/,
        "127.0.0.1 #{node['chef-analytics']['api_fqdn']}")
      fe.write_file
    end
  end
end
