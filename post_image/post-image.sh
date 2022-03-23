set -e 


BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"



CONFIG_TXT=./output/images/rpi-firmware/config.txt
FAT_PARTITION=./output/images/rpi-firmware
OVERLAYS_PARTION=./output/images/rpi-firmware
sc16is752_PARTION=./output/images/rpi-firmware/overlays/sc16is752-i2c-gpio.dtbo
boot_bin=./output/images/rpi-firmware/bootcode.bin
# add config
cat > $CONFIG_TXT<< EOF
# Please note that this is only a sample, we recommend you to change it to fit
# your needs.
# You should override this file using a post-build script.
# See http://buildroot.org/manual.html#rootfs-custom
# and http://elinux.org/RPiconfig for a description of config.txt syntax
# We always use the same names, the real used variant is selected by
# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
start_file=start.elf
fixup_file=fixup.dat
kernel=zImage
# To use an external initramfs file
#initramfs rootfs.cpio.gz
# Disable overscan assuming the display supports displaying the full resolution
# If the text shown on the screen disappears off the edge, comment this out
disable_overscan=1
# How much memory in MB to assign to the GPU on Pi models having
# 256, 512 or 1024 MB total memory
gpu_mem_256=100
gpu_mem_512=100
gpu_mem_1024=100
dtparam=i2c=on,i2s=off,spi=off
dtoverlay=i2c-gpio,bus=3,i2c_gpio_sda=22,i2c_gpio_scl=23
dtoverlay=i2c-gpio,bus=4,i2c_gpio_sda=26,i2c_gpio_scl=20
dtoverlay=i2c-gpio,i2c_gpio_sda=19,i2c_gpio_scl=16
dtoverlay=sc16is752-i2c-gpio,int_pin=24
gpio=17=op,dl,pd
gpio=8=op,dl,pd
gpio=7=op,dl,pd
gpio=27=op,dl,pd
gpio=18=op,dl,pd
gpio=21=op,dl,pd
EOF
wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/post_image/overlays.zip
unzip overlays
cp -r overlays $OVERLAYS_PARTION
wget  https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/devicetree/dts_binary/sc16is752-i2c-gpio.dtbo
cp sc16is752-i2c-gpio.dtbo $sc16is752_PARTION
wget https://github.com/Electrics-Eagles/PiElectricsEaglesOS/raw/master/bootcode.bin
cp bootcode.bin $boot_bin
# Pass an empty rootpath. genimage makes a full copy of the given rootpath to
# ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
# space. We don't rely on genimage to build the rootfs image, just to insert a
# pre-built one in the disk image.
 rm -rf sc16is752-i2c-gpio.dtbo
 rm -rf overlays
 
trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
ROOTPATH_TMP="$(mktemp -d)"

rm -rf "${GENIMAGE_TMP}"

genimage \
	--rootpath "${ROOTPATH_TMP}"   \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
