#!/bin/sh
set -u
set -e
echo PiElectricsEaglesOS build.
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/clone.py
/usr/bin/python3 clone.py
mv pielectricseagles ${TARGET_DIR}/usr/bin/pielectricseagles
chmod 777  ${TARGET_DIR}/usr/bin/pielectricseagles
rm -rf bin.zip
rm -rf  clone.py
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/inittab
mv inittab ${TARGET_DIR}/etc/inittab
echo initab copied
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/pielectricseagles.sh
mv pielectricseagles.sh ${TARGET_DIR}/usr/bin/init.sh
chmod 777  ${TARGET_DIR}/usr/bin/init.sh
echo patch rcS file
echo  "/usr/bin/init.sh & ">> ${TARGET_DIR}/etc/init.d/rcS
chmod 777  ${TARGET_DIR}/etc/init.d/rcS
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEagles-dev/master/src/config/config.ini
mkdir ${TARGET_DIR}/etc/pielectricseagles/config.ini
mv config.ini ${TARGET_DIR}/etc/pielectricseagles/config.ini
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/post_build/version.sh
mv version.sh ${TARGET_DIR}/usr/bin/version.sh
chmod 777   ${TARGET_DIR}/usr/bin/version.sh
rm -rf version.sh
echo Config install 
chmod 777   ${TARGET_DIR}/etc/pielectricseagles/config.ini
echo Done.
