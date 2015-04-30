# Variables
image = node[:composer][:docker][:image_name]
image_tag = node[:composer][:docker][:image_tag]
http_port = node[:composer][:docker][:http_port]
transport_port = node[:composer][:docker][:transport_port]
detach = node[:composer][:docker][:detach]
container_name = node[:composer][:docker][:container_name]
volume = node[:composer][:docker][:volume]

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
docker_container image do
  detach detach
  port http_port
  port transport_port
  opt '--restart=always'
  container_name container_name
  volume volume 
end