#
# Cookbook Name:: oc-graphite
# Attributes:: default
#
# Copyright (C) 2014, Chef Software, Inc <legal@getchef.com>
#

default['oc-graphite']['carbon_cache']['enable'] = true

default['oc-graphite']['carbon']['data_dir'] = '/var/lib/graphite/whisper/'
default['oc-graphite']['carbon']['user'] = '_graphite'

default['oc-graphite']['web']['secret_key'] = '0aed5c39507562f4519c2d47515e8221'
default['oc-graphite']['web']['time_zone'] = 'UTC'
default['oc-graphite']['web']['server'] = 'uwsgi'

# Carbon-relay

default['graphite']['carbon']['carbon_relay_enabled'] = false
# Add Host:PICKLE_RECEIVER_PORT for carbon-aggregator instances you want to relay to (use 127.0.0.1 for localhost)
default['graphite']['carbon']['carbon_relay_destinations'] = '127.0.0.1:2024,172.26.169.159:2024'

# Clustering

# Add array of cluster web servers (excluding localhost!) e.g.'["172.26.169.159:8080", "172.26.169.159"]'
default['oc-graphite']['web']['cluster_servers'] = '[]'
# Add array of memcached hosts (including localhost ip!) e.g.'["172.26.169.159:8080", "172.26.169.159"]'
default['oc-graphite']['web']['memcached_hosts'] = '["127.0.0.1:11211"]'


# This does not update after initial setup
default['oc-graphite']['web']['seed_password'] = 'changeme'

# These defaults are over riddent in the _nginx recipe
default['oc-graphite']['uwsgi']['listen_ip']   = '0.0.0.0'
default['oc-graphite']['uwsgi']['listen_port'] = 8080

default['oc-graphite']['nginx']['disable_default_vhost'] = false
# The template will use the host's FQDN unless this attribute is set
default['oc-graphite']['nginx']['hostname'] = nil
