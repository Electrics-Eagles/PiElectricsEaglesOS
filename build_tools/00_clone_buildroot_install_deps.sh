
# Alex Zaslavskis 2021 for PiElectricsEagles 
#
#
#
# Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
#

#/bin/sh
echo Electrics-Eagles team  for PiElectricsEagles
echo Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
echo Perpare to clone buildroot-2020.11
wget https://buildroot.org/downloads/buildroot-2020.11.tar.gz
echo Install depenedcies using apt-get Qt5 and Qt5 creator
sudo apt-get install build-essential libgl1-mesa-dev -y 
sudo apt-get install build-essential -y
sudo apt-get install qtcreator -y 
sudo apt-get install qt5-default -y 
echo Unpack the buildroot-2020.11 tar.gz archive 
tar xvjf buildroot-2020.11.tar.gz
echo Remove the archive file
rm -rf buildroot-2020.11.tar.gz
echo move to folder
cd buildroot-2020.11
echo set to configuration to raspberrypi zero 
make raspberrypi0_defconfig 
echo finally roun configurator in gui mode using Qt5 mode
make xconfig
