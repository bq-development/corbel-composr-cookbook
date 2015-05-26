#
# Cookbook Name:: composer
# Recipe:: config
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

conf = node[:composer][:config]

dir = node[:composer][:dir]

directory dir do
mode  '0755'
owner 'root'
group 'root'
end

template "#{dir}/config.json" do
  source 'config.json.erb'
  mode   '0644'
  owner  'root'
  group  'root'
  variables({
    :rabbitmq_host => conf[:rabbitmq_host],
    :rabbitmq_port => conf[:rabbitmq_port],
    :rabbitmq_username => conf[:rabbitmq_username],
    :rabbitmq_password => conf[:rabbitmq_password],
    :rabbitmq_reconntimeout => conf[:rabbitmq_reconntimeout],
    :client_id => conf[:client_id],
    :client_secret => conf[:client_secret],
    :scopes => conf[:scopes],
    :urlbase => conf[:urlbase],
    :loglevel => conf[:loglevel],
    :logfile => conf[:logfile],
    :syslog => conf[:syslog]
  })

end