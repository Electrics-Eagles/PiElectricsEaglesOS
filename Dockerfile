# Comment
FROM alpine:3.8
RUN echo 'We will build PiElectricsEagles'
RUN apk update
RUN apk  add   make  gcc g++  tar  unzip  wget  git file cpio bc rsync bash perl patch 	linux-headers
ADD https://buildroot.org/downloads/buildroot-2021.11.tar.gz buildroot.tar.gz
RUN tar -xzvf buildroot.tar.gz
WORKDIR "./buildroot-2021.11"
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/post-build.sh ./board/raspberrypi/post-build.sh
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/post-image.sh ./board/raspberrypi/post-image.sh
ADD https://github.com/Electrics-Eagles/PiElectricsEaglesOS/blob/master/post_image/genimage-raspberrypi0.cfg ./board/raspberrypi/genimage-raspberrypi0.cfg
ADD https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/.config .config
RUN make raspberrypi0_defconfig
RUN make all >> log.txt
