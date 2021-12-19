# Comment
FROM ubuntu:21.04
RUN echo 'We will build PiElectricsEagles'
RUN apt update
RUN apt -y install   make build-essential gcc g++  tar  unzip  wget    cvs git mercurial  subversion asciidoc w3m dblatex 
ADD https://buildroot.org/downloads/buildroot-2021.11.tar.gz buildroot.tar.gz
RUN tar -xvf buildroot.tar.gz
WORKDIR "/buildroot-2021.11"
RUN wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/deps/buildroot_config/.config
RUN make raspberrypi0_defconfig
RUN wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/deps/drivers/ch340_package_buildroot.zip
RUN wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/deps/drivers/rtl8153_package_buildroot.zip
