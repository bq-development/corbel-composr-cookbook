image = node[:composer][:docker][:image_name]
port = node[:composer][:docker][:port]
detach = node[:composer][:docker][:detach]
container_name = node[:composer][:docker][:container_name]
volume = node[:composer][:docker][:volume]
# Pull latest image
docker_image image

# Run container exposing ports
docker_container image do
  detach detach
  port port
  container_name container_name
  volume volume 
end