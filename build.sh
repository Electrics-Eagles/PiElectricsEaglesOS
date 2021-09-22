# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Under MIT Licence 
#

#/bin/sh
echo build-essential libgl1-mesa-dev texinfo
echo these are deps requried for build install using your package manager
echo Electrics-Eagles team  for PiElectricsEagles
echo Tool that clone install deps and perpare the buildroot 2020 11 for PiElectricsEaglesOS build
echo Perpare to clone buildroot-2020.11
wget https://buildroot.org/downloads/buildroot-2020.11.tar.gz
echo Install depenedcies using apt-get Qt5 and Qt5 creator
echo Unpack the buildroot-2020.11 tar.gz archive 
tar -xvzf buildroot-2020.11.tar.gz
echo Remove the archive file
rm -rf buildroot-2020.11.tar.gz
echo move to folder
cd buildroot-2020.11
echo set to configuration to raspberrypi zero 
make raspberrypi0_defconfig 
wget https://raw.githubusercontent.com/Electrics-Eagles/PiElectricsEaglesOS/master/buildroot_config/.config -O .config
chmod  755 .config
cat > ./buildroot-2021.05/output/target/etc/init.d/rcS << EOF
#/bin/sh
# Electrics-Eagles team 2021 for PiElectricsEagles 
#
#
#
# Under MIT Licence 
/usr/bin/pielectricseagles.sh &
EOF
rm  -rf ./buildroot-2021.05/output/target/etc/inittab
cat >  ./buildroot-2021.05/output/target/etc/inittab << EOF
# /etc/inittab
#
# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
#
# Note: BusyBox init doesn't support runlevels.  The runlevels field is
# completely ignored by BusyBox init. If you want runlevels, use
# sysvinit.
#
# Format for each entry: <id>:<runlevels>:<action>:<process>
#
# id        == tty to run on, or empty for /dev/console
# runlevels == ignored
# action    == one of sysinit, respawn, askfirst, wait, and once
# process   == program to run

# Startup the system
::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mkdir -p /dev/pts /dev/shm
::sysinit:/bin/mount -a
::sysinit:/sbin/swapon -a
null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Put a getty on the serial port
::respawn:-/bin/sh
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console

# Stuff to do for the 3-finger salute
#::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
::shutdown:/etc/init.d/rcK
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r

EOF
sudo cp ./scripts/pielectricseagles.sh  ./buildroot-2021.05/output/target/usr/bin/pielectricseagles.sh
unzip ch340_package_buildroot.zip
sudo cp -R ch340 ./buildroot-2021.05/package
rm -rf ch340_package_buildroot.zip


last_file_release=$(
	curl  https://api.github.com/repos/Electrics-Eagles/PiElectricsEagles-dev/releases/latest \
	| grep browser_download_url \
	| grep pielectricseagles \
	| cut -d '"' -f 4 \
)

sudo cp ./scripts/pielectricseagles.sh  ./buildroot-2021.05/output/target/usr/bin/pielectricseagles.sh
curl -L "$last_file_release" -o pielectricseagles

sudo cp pielectricseagles ./buildroot-2021.05/output/target/usr/bin/pielectricseagles

make > build_log.txt