require 'spec_helper'

describe 'default recipe on Ubuntu 14.04' do
  before do
    @analytics_file = '/etc/opscode-analytics/opscode-analytics.rb'
  end

  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.automatic[:lsb][:codename] = 'trusty'
    end.converge('chef-analytics::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end

  it 'created /etc/opscode-analytics' do
    expect(chef_run).to create_directory('/etc/opscode-analytics')
      .with(owner: 'root', group: 'root', mode: '0755', recursive: true)
  end

  it 'chef_ingredient upgraded analytics to latest' do
    expect(chef_run).to upgrade_chef_ingredient('analytics')
  end

  it 'created /etc/opscode/opscode-analytics.rb' do
    allow(::File).to receive(:exist?).and_call_original
    allow(::File).to receive(:exist?)
      .with('/etc/opscode-analytics/actions-source.json')
      .and_return(true)
    expect(chef_run).to create_template(@analytics_file)
      .with(owner: 'root', group: 'root', source: 'opscode-analytics.rb.erb')
  end

  it 'notifies analytics reconfigure' do
    resource = chef_run.template(@analytics_file)
    expect(resource).to notify('chef_ingredient[analytics]').to(:reconfigure)
      .immediately
  end

  context 'version is not nil' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.automatic[:lsb][:codename] = 'trusty'
        node.normal['chef-analytics']['version'] = '1.4.0'
      end.converge('chef-analytics::default')
    end

    it 'chef_ingredient installed analytics 1.4.0' do
      expect(chef_run).to install_chef_ingredient('analytics')
        .with(version: '1.4.0')
    end
  end
end
