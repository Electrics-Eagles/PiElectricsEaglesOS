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
sudo export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
#Sometimes Buildroot need proper locale, e.g. when using a toolchain
# based on glibc.
sudo  locale-gen en_US.utf8
sudo wget  https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/buildroot-2021.11.tar.gz 

sudo tar -xzvf  buildroot-2021.11.tar.gz 
sudo chmod 777  buildroot-2021.11
cd buildroot-2021.11
sudo wget  https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/post-build.sh
sudo mv post-build.sh ./board/raspberrypi/post-build.sh
sudo chmod 777 ./board/raspberrypi/post-build.sh
sudo wget  https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/post-image.sh
sudo mv post-image.sh ./board/raspberrypi/post-image.sh
sudo chmod 777 ./board/raspberrypi/post-image.sh
sudo wget  https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_image/genimage-raspberrypi0.cfg
sudo mv genimage-raspberrypi0.cfg  ./board/raspberrypi/genimage-raspberrypi0.cfg

sudo make raspberrypi0_defconfig
sudo chmod 777 .config
rm -rf .config
sudo wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/.config
sudo make all -j8 >> log.txt
