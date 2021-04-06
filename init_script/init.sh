
# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
#

#/bin/sh

if [ "$EUID" -ne 0 ]
  then echo "Fatal error (code : NRR) ( run as root please)"
  exit
fi

modprobe bcm2835
modbrode i2c-dev
modprobe spi

modprobe bcm2835
modbrode i2c-bcm2835
modprobe spi-bcm2835

clear
echo Loading init script..........
echo Loading init script..........100%
echo Warring OS is in Real Time mode
echo PiElectricsEaglesOS v1.0 06042021 Alpha
clear

FILE=/etc/pielectricseagles/config.ini
if test -f "$FILE"; then
    echo config detected > /dev/kmsg
    echo config detected
    exit 
else
	  then echo Fatal error (code : NCFD) (create config file please) > /dev/kmsg
	  	   echo Fatal error (code : NCFD) (create config file please) 
	  	   exit  

fi


FILE=/var/pielectricseagles/pielectricseagles.log
if test -f "$FILE"; then
    echo log file detected > /dev/kmsg
    echo log file detected
    sudo mv /var/pielectricseagles/pielectricseagles.log backup.log
    echo log moved to backup.log

else
	  then echo Warring (code : NLFD) (create config file please) > /dev/kmsg
	  	   echo Warring (code : NLFD) (create config file please)
	  	   echo > /var/pielectricseagles/pielectricseagles.log

	  	   

fi




printf "
########  #### ######## ##       ########  ######  ######## ########  ####  ######   ######  ########    ###     ######   ##       ########  ######   #######   ######  
##     ##  ##  ##       ##       ##       ##    ##    ##    ##     ##  ##  ##    ## ##    ## ##         ## ##   ##    ##  ##       ##       ##    ## ##     ## ##    ## 
##     ##  ##  ##       ##       ##       ##          ##    ##     ##  ##  ##       ##       ##        ##   ##  ##        ##       ##       ##       ##     ## ##       
########   ##  ######   ##       ######   ##          ##    ########   ##  ##        ######  ######   ##     ## ##   #### ##       ######    ######  ##     ##  ######  
##         ##  ##       ##       ##       ##          ##    ##   ##    ##  ##             ## ##       ######### ##    ##  ##       ##             ## ##     ##       ## 
##         ##  ##       ##       ##       ##    ##    ##    ##    ##   ##  ##    ## ##    ## ##       ##     ## ##    ##  ##       ##       ##    ## ##     ## ##    ## 
##        #### ######## ######## ########  ######     ##    ##     ## ####  ######   ######  ######## ##     ##  ######   ######## ########  ######   #######   ####






"



echo 
echo 
echo Welcome to PiElectricsEaglesOS V1.0 Alpha 
