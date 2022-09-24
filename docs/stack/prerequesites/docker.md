# [Docker](https://www.docker.com/products/docker-desktop/)

- [Cheat Sheet](https://dockerlabs.collabnix.com/docker/cheatsheet/)
- check version: `docker --version`
- [Docker Hub](https://hub.docker.com/): Registry de containers
- Get image: `docker pull busybox:latest`
- Build image: `docker run busybox`
  - run coomand and kill: `docker run busybox echo "busybox"`
  - iteractive: `docker run -it busybox sh`
  - port foward: `podman run -d -p 3306:3306 quay.io/fatherlinux/linux-container-internals-2-0-introduction`
- Get containers: `docker ps -a`
- Stop containers: `docker stop containerid`
- Delete container: `docker rm containerid`