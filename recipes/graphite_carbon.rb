#
# Cookbook Name:: oc-graphite
# Recipe:: graphite_carbon
#
# Copyright (C) 2014, Chef Software, Inc <legal@getchef.com>

package 'graphite-carbon'

template '/etc/default/graphite-carbon' do
  source 'graphite-carbon.erb'
  mode 0644
  owner 'root'
  group 'root'
end

template '/etc/carbon/carbon.conf' do
  source 'carbon.conf.erb'
  mode 0644
  owner 'root'
  group 'root'
end

template '/etc/carbon/storage-schemas.conf' do
  source 'storage-schemas.conf.erb'
  mode 0644
  owner 'root'
  group 'root'
end

template '/etc/carbon/storage-aggregation.conf' do
  source 'storage-aggregation.conf.erb'
  mode 0644
  owner 'root'
  group 'root'
end

cookbook_file '/etc/carbon/aggregation-rules.conf' do
  source 'aggregation-rules.conf'
  mode 0644
  owner 'root'
  group 'root'
end

cookbook_file '/etc/init.d/carbon-aggregator' do
  source 'carbon-aggregator.sh'
  mode 0755
  owner 'root'
  group 'root'
end

cookbook_file '/etc/init.d/carbon-relay' do
  source 'carbon-relay.sh'
  mode 0755
  owner 'root'
  group 'root'
end


service 'carbon-cache' do
  action [:enable, :start]
  supports :restart => true, :start => true, :stop => true
end

service 'carbon-aggregator' do
  action [:enable, :start]
  supports :restart => true, :start => true, :stop => true
end

service 'carbon-relay' do
  action [:enable, :start]
  supports :restart => true, :start => true, :stop => true
end