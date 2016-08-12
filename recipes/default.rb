#
# Cookbook Name:: sauron
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['sauron'].each do |env, apps|
  apps.each do |name, version|
    execute "chef-client -o 'recipe[#{name}]' -c /tmp/kitchen/client.rb --lockfile /tmp/#{env}.lock -E #{env}"
  end
end
