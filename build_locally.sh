# Comment

echo 'We will build PiElectricsEagles'
sudo apt  update
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update && \
    sudo apt-get install -y \
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
    pkg-config \
    
    
    
sudo apt install linux-headers-$(uname -r) libssl-dev -y
sudo apt install libssl1.0-dev -y 
sudo apt install libcrypto++6 libcurl4-openssl-dev -y
sudo  
sudo export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
#Sometimes Buildroot need proper locale, e.g. when using a toolchain
# based on glibc.
sudo  locale-gen en_US.utf8












sudo https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/buildroot-2021.11.tar.gz  buildroot.tar.gz
sudo tar -xzvf buildroot.tar.gz


cd /buildroot-2021.11
curl  https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/post-build.sh  -o./board/raspberrypi/post-build.sh
 chmod 777 ./board/raspberrypi/post-build.sh
curl https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/post-image.sh  -o ./board/raspberrypi/post-image.sh
chmod 777 ./board/raspberrypi/post-image.sh
curl https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/genimage-raspberrypi0.cfg  -o ./board/raspberrypi/genimage-raspberrypi0.cfg

sudo make raspberrypi0_defconfig
curl https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/.config  -o .config
make all >> log.txt