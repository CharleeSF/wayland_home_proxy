#!/bin/sh

PROXY_DIR=/home/$(id -un)/wayland-proxy
PROXY_PATH=$PROXY_DIR/$WAYLAND_DISPLAY
WAYLAND_SOCKET=/run/user/$(id -u)/$WAYLAND_DISPLAY

echo "Starting socat to connect $WAYLAND_SOCKET with $PROXY_PATH"

$SNAP/usr/bin/socat UNIX-LISTEN:$PROXY_PATH,reuseaddr,fork,user=$(id -u),group=$(id -g) UNIX-CONNECT:$WAYLAND_SOCKET || echo "ERROR: Failed to connect sockets!"