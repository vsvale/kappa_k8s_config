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

## Docker compose

- Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

## Container Images

- Container images are tar files, with an associated JSON file. Together we call these an Image Bundle.
- Container images make it easy for software builders to package software, as well as provide information about how to run it. Using metadata, software builders can communicate how users can and should run their software, while providing the flexibility to also build new things based on existing software.
- **Portability**: a container image can be created and pushed to almost any container registry, shared with the world, and consumed by almost any container engine. The image format is the same no matter which operating system or binaries are in the container image.
- **Compatibility**: This addresses the content inside the container image. Containers do not offer compatibility guarantees; only virtualization can do that. This compatibility problem extends to processor architecture, and also versions of the operating system. However, as long as the operating systems are reasonably similar, the binaries in the container image will usually run.
- **Supportability**: This is what vendors can support. This is about investing in testing, security, performance, and architecture as well as ensuring that images and binaries are built in a way that they run correctly on a given set of container hosts. Vendor t cannot guarantee that every permutation of container image and host combination on the planet will work

## Container Registries

- Registries are really just fancy file servers that help users share container images with each other.
- Builders can push an image to a registry, allowing users and even automation like CI/CD systems to pull it down and use it
- Curated registries are good for partners who want to deliver solutions together, while cloud-based registries are good for end users collaborating on work.

## Container Engine

- Any tool which provides an API or CLI for building or running containers
- A container engine accepts user inputs, pulls container images, creates some metadata describing how to run the container, then passes this information to a container Runtime.

## Container Runtime

- runc is the default
- This tool expect a directory, root file system (rootfs), and metadata, config.json (spec file)

## Linux Kernel

- The kernel is responsible for the last mile of container creation, as well as resource management during its running lifecycle
- The container runtime talks to the kernel to create the new container with a special kernel function called clone()
- Containers are just regular Linux processes that were started as child processes of a container runtime. All of these processes make requests to the Linux kernel for protected resources like memory, RAM, TCP sockets, etc

## Container Orchestration

- With orchestration, there is a significant paradigm shift - developers and administrators alike need to think differently, making all changes to applications through an API.
- Kubernetes is the clear winner when it comes to container orchestration

### Benefits Orchestration

- **Application Definitions**: YAML and JSON files can be passed between developers or from developers to operators to run fully-functioning, multi-container applications
- **Easy Application Instances**: Run many versions of the same application in different namespaces
- **Multi-Node Scheduling**: controllers built into Kubernetes manage 10 or 10,000 container hosts with no extra complexity
- **Powerful API**: Developers, Cluster Admins, and Automation alike can define application state and tenancy
- **Operational Automation**: The Kubernetes Operator Framework can be thought of as a robot systems administrator deployed side by side with applications managing mundane and complex tasks for the application (backups, restores, etc)
- **Higher Level Frameworks**: Once you adopt Kubernetes orchestration, you gain access to an innovative ecosystem of tools like Istio, Knative, and the previously mentioned Operator Framework
