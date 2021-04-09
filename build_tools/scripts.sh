
# Alex Zaslavskis 2021 for PiElectricsEagles 
#
#
#
# Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
#

#/bin/sh

wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/init_script/init.sh -O init.sh 
wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/blob/master/load_drone_code/load_code.sh -O init_drone.sh
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/tools/version -O version
chmod -R 777 init.sh
chmod -R 777 init_drone.sh
chmod -R 777 version


