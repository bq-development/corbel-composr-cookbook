# Variables
image = node[:composer][:docker][:image_name]
image_tag = node[:composer][:docker][:image_tag]
port = node[:composer][:docker][:port]
detach = node[:composer][:docker][:detach]
container_name = node[:composer][:docker][:container_name]
volume = node[:composer][:docker][:volume]
endpoint_sufix = node[:composer][:docker][:endpoint_sufix]

# Stop/Remove Container
docker_container container_name do
  action :stop
end
docker_container container_name do
  action :remove
end
# Delete image
docker_image image do
  tag image_tag
  action :remove
end
# Pull tagged image
docker_image image do
  tag image_tag
end

# Run container
docker_container container_name do
  image "#{image}:#{image_tag}"
  detach detach
  port port
  container_name container_name
  volume volume
  env "ENDPOINT_SUFFIX=#{$endpoint_sufix}"
end