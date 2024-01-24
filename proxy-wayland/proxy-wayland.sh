#!/bin/sh

# WAYLAND_USER=0 # Hardcoded because hardcoded in ubuntu-frame
# WAYLAND_DISPLAY=wayland-0
# HOME_USER=1000 # Hardcoded now because..
echo "WAYLAND_DISPLAY: $WAYLAND_DISPLAY"
echo "XDG_RUNTIME_DIR: $XDG_RUNTIME_DIR"

exit -1

PROXY_DIR=/home/$HOME_USER/wayland-proxy
PROXY_PATH=$PROXY_DIR/$WAYLAND_DISPLAY
WAYLAND_DIR=/run/user/$WAYLAND_USER
WAYLAND_SOCKET=$WAYLAND_DIR/$WAYLAND_DISPLAY

# echo "Starting socat to connect $WAYLAND_SOCKET with $PROXY_PATH"
# $SNAP/usr/bin/socat UNIX-LISTEN:$PROXY_PATH,reuseaddr,fork,user=$(id -u),group=$(id -g) UNIX-CONNECT:$WAYLAND_SOCKET || echo "ERROR: Failed to connect sockets!"

LINK_DIR=$PROXY_DIR/link
echo "Linking $WAYLAND_DIR to $LINK_DIR"
ln -s $WAYLAND_DIR $LINK_DIR