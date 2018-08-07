all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build            - build all images"
	@echo "   2. make pull             - pull all images"
	@echo "   3. make clean            - remove all images"
	@echo ""

setup:
	./librealsense/build.sh

build: setup
	@docker build \
		--build-arg repository=nvidia/opengl \
		--build-arg tag=1.0-glvnd-runtime-ubuntu16.04 \
		--tag=edowson/intel:librealsense-xenial \
		librealsense/.

pull:
	@docker pull edowson/intel:librealsense-xenial

clean:
	@docker rmi -f edowson/intel:librealsense-xenial
