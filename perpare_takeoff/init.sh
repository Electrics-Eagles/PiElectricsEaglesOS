# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Under MIT Licence 
#
# Written 06/04/2021

#/bin/sh
#Tool that clone install deps and perpare the buildroot for PiElectricsEaglesOS build

sudo chmod -R 777 /dev/ttyAMA0
sudo chmod -R 777 /usr/bin/pielectricseagles # bugix 14.04.2021

FILE=/etc/pielectricseagles/config.ini
if test -f "$FILE"; then
    echo 'config detected' > /dev/kmsg
    echo 'config detected' 
else
	   echo 'Fatal error (code : NCFD) (create config file please)' > /dev/kmsg
	   echo 'Fatal error (code : NCFD) (create config file please)'
	   exit  

fi


FILE=/var/pielectricseagles/pielectricseagles.log
if test -f "$FILE"; then
    echo 'log file detected' > /dev/kmsg
    echo 'log file detected'
    sudo mv /var/pielectricseagles/pielectricseagles.log backup.log
    echo 'log moved to backup.log'

else
	   echo 'Warring (code : NLFD) (create config file please)' > /dev/kmsg
	   echo 'Warring (code : NLFD) (create config file please)'
	   echo > /var/pielectricseagles/pielectricseagles.log
fi

pielectricseagles &
