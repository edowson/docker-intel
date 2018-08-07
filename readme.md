## Docker container images for Intel libraries.

This repository contains docker images for the following Intel libraries:
- [librealsense](https://github.com/IntelRealSense/librealsense)

### Build instructions

#### librealsense

This librealsense images is intended to be built and run on an Ubuntu host
running Linux kernel 4.15 or lower.

This dockerfile attempts to match the version of the kernel headers in the docker container with that of the host during the installation of the librealsense binaries.

This dockerfile is based on the NVIDIA Docker 2.0 OpenGL image. This requires
installation the [nvidia-docker 2.0](https://github.com/NVIDIA/nvidia-docker) container runtime  using these [instructions](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)
.


After [installing]((https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0) the nvidia-docker 2.0 runtime, build the librealsense docker image using the supplied makefile:
```
cd realsense/ubuntu/xenial
make build
```
 or perform the build steps manually, as follows:

```
cd realsense/ubuntu/xenial/librealsense
./setup.sh
./build.sh
```

Running the docker image requires elevated privileges since the docker container
will need to access the host's USB ports.

```
./run.sh
```

```
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
```

### License

This project is licensed under the [MIT License](./LICENSE). Copyright 2018 Elvis Dowson.

### License acknowledgements

#### Intel RealSense

- [librealsense](https://github.com/IntelRealSense/librealsense) is licensed under the [Apache License, Version 2.0](https://github.com/IntelRealSense/librealsense/blob/master/LICENSE). Copyright 2017 Intel Corporation.
