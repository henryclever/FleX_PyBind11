FROM nvidia/cudagl:9.2-devel

RUN apt update && apt install -y freeglut3-dev build-essential \
	cmake python-pip libeigen3-dev && \
	pip install numpy
COPY . /flex
WORKDIR /flex
ENV FleX_ROOT /flex

# Install bindings
RUN pip install ./bindings



