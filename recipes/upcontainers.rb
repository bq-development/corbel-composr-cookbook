# Variables
time = node[:composr][:time]
docker_command = node[:composr][:command]
# Exec
cron_d 'upstart-containers' do
  predefined_value time
  command docker_command
  user    'root'
end