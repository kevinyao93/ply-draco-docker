FROM ubuntu:18.04

COPY . /app

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install build-essential -y && \
    apt-get install -y wget && \
    apt-get install -y nano

RUN apt-get install -y gcc && \
    apt-get install -y g++

RUN apt-get install -y libjpeg-dev zlib1g-dev

RUN apt-get update && apt-get install -y \
    python3.6 \
    python3-distutils \
    python3-pip \
    python3-apt \
    zip \
    unzip \
    ffmpeg \
    libsm6 \
    libxext6

RUN wget https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4-Linux-x86_64.sh \
      -q -O /tmp/cmake-install.sh \
      && chmod u+x /tmp/cmake-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/cmake-install.sh
ENV LD_LIBRARY_PATH=lib/python3.6/site-packages/open3d

ENV PATH="/usr/bin/cmake/bin:${PATH}"

ENV CC=/usr/bin/gcc \
    CXX=/usr/bin/g++


WORKDIR $HOME/app
RUN mkdir ./library
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

WORKDIR $HOME/app/pydraco/draco
RUN mkdir build_dir && \
    cd build_dir &&\
    cmake ../ &&\
    make &&\
    make install

WORKDIR $HOME/app/pydraco
RUN set -ex \
    python3 setup.py build &&\
    python3 setup.py install 

WORKDIR $HOME/app
