#!/bin/sh
docker build \
  --file Dockerfile \
  --build-arg repository=nvidia/opengl \
  --build-arg tag=1.0-glvnd-runtime-ubuntu16.04 \
  -t edowson/intel:librealsense-xenial .
