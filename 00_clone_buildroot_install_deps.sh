# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Under MIT Licence 
#

#/bin/sh
echo build-essential libgl1-mesa-dev texinfo
echo these are deps requried for build install using your package manager
echo Electrics-Eagles team  for PiElectricsEagles
echo Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
echo Perpare to clone buildroot-2020.11
wget https://buildroot.org/downloads/buildroot-2020.11.tar.gz
echo Install depenedcies using apt-get Qt5 and Qt5 creator
echo Unpack the buildroot-2020.11 tar.gz archive 
tar -xvzf buildroot-2020.11.tar.gz
echo Remove the archive file
rm -rf buildroot-2020.11.tar.gz
echo move to folder
cd buildroot-2020.11
echo set to configuration to raspberrypi zero 
make raspberrypi0_defconfig 
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/buildroot_config/.config -O .config
chmod  755 .config




cat > rcS << EOF
#/bin/sh
# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Under MIT Licence 

/usr/bin/pielectricseagles.sh &
EOF
cd .. 



sudo cp  ./drivers/ch340_package_buildroot.zip ./rtc/ch340_package_buildroot.zip



unzip ch340_package_buildroot.zip
unzip rtl8153_package_buildroot.zip


rm -rf ch340_package_buildroot.zip
rm -rf rtl8153_package_buildroot.zip





wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/init_script/init.sh -O loading.sh 
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/perpare_takeoff/init.sh -O loading_drone.sh
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/tools/version -O version
wget https://github.com/Electrics-Eagles/PiElectricsEagles/releases/download/v1-12.04.2021/pielectricseagles
chmod -R 777 loading.sh
chmod -R 777 loading_drone.sh
chmod -R 777 version
chmod -R 777 pielectricseagles
