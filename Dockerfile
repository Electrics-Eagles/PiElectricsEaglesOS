# Comment
FROM alpine:3.8
RUN echo 'We will build PiElectricsEagles'
RUN apk update
RUN apk  add   make  gcc g++  tar  unzip  wget  git file cpio bc rsync bash perl patch 	linux-headers  
ADD https://buildroot.org/downloads/buildroot-2021.11.tar.gz buildroot.tar.gz
RUN tar -xvf buildroot.tar.gz

RUN wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/deps/buildroot_config/.config
RUN make raspberrypi0_defconfig
RUN wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/deps/drivers/ch340_package_buildroot.zip
RUN wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/deps/drivers/rtl8153_package_buildroot.zip
RUN make all 
COPY pielectricseagles.sh ./buildroot-2021.11/output/target/usr/bin
RUN rm  -rf ./buildroot-2021.11/output/target/etc/inittab
COPY inittab ./buildroot-2021.11/output/target/etc/inittab
RUN unzip ch340_package_buildroot.zip
RUN sudo cp -R ch340 ./buildroot-2021.11/package
RUN rm -rf ch340_package_buildroot.zip
RUN sudo cp ./scripts/pielectricseagles.sh  ./buildroot-2021.11/output/target/usr/bin/pielectricseagles.sh
RUN curl -L "$last_file_release" -o pielectricseagles
RUN sudo cp pielectricseagles ./buildroot-2021.11/output/target/usr/bin/pielectricseagles
