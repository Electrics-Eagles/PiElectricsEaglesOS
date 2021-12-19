# Comment
FROM ubuntu:21.04
RUN echo 'We will build PiElectricsEagles'
RUN sudo apt update
RUN  sudo apt install which sed make build-essential gcc g++ bash patch gzip bzip2 perl tar cpio unzip rsync file  bc wget ncurses5  bazaar cvs git mercurial scp subversion asciidoc w3m dblatex 
COPY ./deps
ADD https://buildroot.org/downloads/buildroot-2021.11.tar.gz buildroot.tar.gz
RUN tar -xvf buildroot.tar.gz
WORKDIR "/buildroot-2021.11"
RUN make raspberrypi0_defconfig
