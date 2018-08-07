#!/bin/sh
xhost +local:root
docker run -it \
  --runtime=nvidia \
  -e DISPLAY \
  -e QT_GRAPHICSSYSTEM=native \
  -e QT_X11_NO_MITSHM=1 \
  -v /dev:/dev \
  -v /lib/modules:/lib/modules \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --privileged \
  --cap-add=ALL \
  --rm \
  edowson/intel:librealsense-xenial
xhost -local:root
