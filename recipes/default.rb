#
# Cookbook Name:: oc-graphite
# Recipe:: graphite_web
#
# Copyright (C) 2014, Chef Software, Inc <legal@getchef.com>

include_recipe "memcached::default"
include_recipe "python"

#log "The oc-graphite::default recipe doesn't do anything"
