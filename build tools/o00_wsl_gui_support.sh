
# Alex Zaslavskis 2021 for PiElectricsEagles 
#
#
#
# Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
#

#/bin/sh
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
sudo /etc/init.d/dbus start &> /dev/null