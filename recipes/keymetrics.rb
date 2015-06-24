#Variables
keymetrics_name = node[:composer][:keymetrics][:keymetrics_name]
keymetrics_public = node[:composer][:keymetrics][:keymetrics_public]
keymetrics_private = node[:composer][:keymetrics][:keymetrics_private]


execute 'keymetrics' do
  command "docker exec -d corbel-composer pm2 link #{keymetrics_private} #{keymetrics_public} #{keymetrics_name}"
end
