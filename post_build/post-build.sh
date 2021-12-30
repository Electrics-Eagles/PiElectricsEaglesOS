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
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/deps/scripts/pielectricseagles.sh

mv pielectricseagles.sh ${TARGET_DIR}/usr/bin/init.sh
chmod 777  ${TARGET_DIR}/usr/bin/init.sh
echo patch rcS file
echo  "/usr/bin/init.sh & ">> ${TARGET_DIR}/etc/init.d/rcS
chmod 777  ${TARGET_DIR}/etc/init.d/rcS
echo Done. 