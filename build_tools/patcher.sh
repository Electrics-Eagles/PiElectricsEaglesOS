
rm -rf S99app
echo Patcher V1.0 Beta 
echo This Script will create  your /etc/init.d scrpit 
echo "#!/bin/sh " > S99app

echo "# Loading the modules needed by my app:" >> S99app

 
echo "# Launching my app: ">> S99app
echo "/usr/bin/loading.sh &  " >> S99app      

exit 0
