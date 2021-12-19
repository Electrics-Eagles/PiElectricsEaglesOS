# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Under MIT Licence 
#

#/bin/sh

if [ "$EUID" -ne 0 ]
  then echo "Fatal error (code : NRR) ( run as root please)"
  exit
fi
echo Loading crucal modules
modprobe i2c-bcm2835
modprobe i2c-dev
modprobe ch341 # additional drivers support added 13.04.2021
# modprobe r8152 # additional drivers support added 13.04.2021 (deprecated from 30/06/2021)
modprobe cp210x # additional drivers for cp210x :) added 30/06/2021
modprobe i2c-gpio # additional drivers for cp210x :) added 02/07/2021


clear
echo Loading init script..........
echo Loading init script..........100%
echo Warring OS is in Real Time mode
echo PiElectricsEaglesOS v1.0 06042021 Alpha
clear





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

sudo chmod  755 /dev/ttyAMA0
sudo chmod  755 /usr/bin/pielectricseagles # bugfix 14.04.2021

FILE=/etc/pielectricseagles/config.ini
if test -f "$FILE"; then
    echo 'config detected' > /dev/kmsg
    echo 'config detected' 
else
     echo 'Fatal error (code : NCFD) (create config file please)' > /dev/kmsg
     echo 'Fatal error (code : NCFD) (create config file please)'
     exit  

fi


echo 'Warring (code : NLFD) (create config file please)' > /dev/kmsg
echo 'Warring (code : NLFD) (create config file please)' # bugfix 06.07.2021
exit 0  # bugfix 22.09.2021

sudo pielectricseagles & # bugfix 06.07.2021