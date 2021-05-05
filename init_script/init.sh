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
modprobe r8152 # additional drivers support added 13.04.2021



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

loading_drone.sh 
