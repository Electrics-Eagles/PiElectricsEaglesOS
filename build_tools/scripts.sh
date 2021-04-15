
# Alex Zaslavskis 2021 for PiElectricsEagles 
#
#
#
# Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
#

#/bin/sh

wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/init_script/init.sh -O loading.sh 
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/load_drone_code/load_code.sh -O loading_drone.sh
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/tools/version -O version
wget https://github.com/Electrics-Eagles/PiElectricsEagles/releases/download/v1-12.04.2021/pielectricseagles
chmod -R 777 loading.sh
chmod -R 777 loading_drone.sh
chmod -R 777 version
chmod -R 777 pielectricseagles
