# Comment
FROM ubuntu:latest
RUN echo 'We will build PiElectricsEagles'
RUN apt  update
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    bash \
    python3 \
    bc \
    binutils \
    build-essential \
    bzip2 \
    cpio \
    g++ \
    gcc \
    git \
    gzip \
    locales \
    libncurses5-dev \
    libdevmapper-dev \
    libsystemd-dev \
    make \
    mercurial \
    whois \
    patch \
    perl \
    python \
    rsync \
    sed \
    tar \
    vim \ 
    unzip \
    wget \
    bison \
    flex \
    libssl-dev \
    libfdt-dev
    pkg-config 
    
    
RUN  apt install linux-headers-$(uname -r) libssl-dev  libssl1.0 -y 
RUN export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
# Sometimes Buildroot need proper locale, e.g. when using a toolchain
# based on glibc.
RUN locale-gen en_US.utf8










RUN ["/bin/bash"]

ADD https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/buildroot-2021.11.tar.gz /root/buildroot.tar.gz
WORKDIR "/root"
RUN tar -xzvf /root/buildroot.tar.gz
RUN cd /root && ls 

WORKDIR "/root/buildroot-2021.11"
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/post-build.sh ./board/raspberrypi/post-build.sh
RUN chmod 777 ./board/raspberrypi/post-build.sh
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/post-image.sh ./board/raspberrypi/post-image.sh
RUN chmod 777 ./board/raspberrypi/post-image.sh
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/genimage-raspberrypi0.cfg ./board/raspberrypi/genimage-raspberrypi0.cfg

RUN make raspberrypi0_defconfig
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/.config .config
RUN make all >> log.txt
