# Description

This snap exposes the wayland interface to the home directory.

This is a workaround to let docker have access to the wayland interface while only being allowed to access the home directory.

To be able to expose the wayland interface, wayland-home-proxy should be connected to a snap with a wayland slot! Such as ubuntu-frame

# Tested

Following succession of commands should show the flutter UI running from inside the docker, on Ubuntu Desktop:

```
# Install ubuntu frame
sudo snap install ubuntu-frame

# Make, install and connect wayland-home-proxy snap
snapcraft
sudo snap install --devmode wayland-home-proxy_0.1_amd64.snap
sudo snap connect wayland-home-proxy:wayland ubuntu-frame:wayland
# Start the snap

# Build and run docker
cd example
docker build --rm -f ./Dockerflutter -t flutter_docker .
docker run -e XDG_RUNTIME_DIR=/tmp -e WAYLAND_DISPLAY=wayland-0 -v /home/$(id -un)/wayland-proxy/link:/tmp flutter_docker
```

