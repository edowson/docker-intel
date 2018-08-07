# edowson/intel:librealsense-xenial

# docker build -t edowson/intel:librealsense-xenial .
# xhost +local:root
# docker run --runtime=nvidia -ti --rm -e DISPLAY -e QT_GRAPHICSSYSTEM=native -e QT_X11_NO_MITSHM=1 -v /dev:/dev -v /lib/modules:/lib/modules -v /tmp/.X11-unix:/tmp/.X11-unix --privileged --cap-add=ALL edowson/intel:librealsense-xenial
# xhost -local:root

ARG repository
ARG tag
FROM ${repository}:${tag} as build
LABEL maintainer "Elvis Dowson <elvis.dowson@gmail.com>"
LABEL description "Intel RealSense Camera librealsense - Ubuntu-16.04."

# setup environment
ENV container docker
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display
ARG DEBIAN_FRONTEND=noninteractive
ARG TERM=linux

# set the locale
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ $(lsb_release -cs) main restricted \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-updates main restricted \n\
deb-src http://us.archive.ubuntu.com/ubuntu/ $(lsb_release -cs)-backports main restricted universe multiverse \n\
deb-src http://security.ubuntu.com/ubuntu $(lsb_release -cs)-security main restricted" \
    > /etc/apt/sources.list.d/official-source-repositories.list

# install build tools and kernel header packages
# note: this dockerfile will only work on ubuntu hosts and will fail on other
# distros because of the kernel host-specific query `(uname -r)` in the command
# `apt-get install linux-image-(uname -r)`
RUN apt-get update \
    && apt-get install --no-install-recommends -q -y \
    apt-utils \
    build-essential \
    cmake \
    cmake-curses-gui \
    git \
    pkg-config \
    sudo \
    udev \
    && apt-get install --no-install-recommends -q -y \
    linux-image-$(uname -r) \
    linux-headers-$(uname -r) \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# install libraries
RUN apt-get update \
    && apt-get install --no-install-recommends -q -y \
    libglfw3-dev \
    libgtk-3-dev \
    libssl-dev \
    libusb-1.0-0-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# setup keys for intel's repository server
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
RUN echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/realsense-public.list

# install intel realsense libraries
RUN apt-get update \
    && apt-get install --no-install-recommends -q -y \
    librealsense2 \
    librealsense2-dkms \
    librealsense2-utils \
    realsense-uvcvideo \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# optional: download librealsense sources
# build, install
# skip kernel patches, kernel has to be patched on host

CMD ["bash"]
