# Docker Build

## REQUIREMENTS
- [Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [nvidia-docker](https://github.com/nvidia/nvidia-docker/)

## BUILD
```
docker build -t pyflex .
```


## RUN

Do this before the first run.
```
sudo xhost +
```

Run the container.
```
docker run --runtime=nvidia -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -ti pyflex bash
```
