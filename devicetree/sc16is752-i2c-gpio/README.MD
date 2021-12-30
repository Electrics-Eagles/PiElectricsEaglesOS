SC16is752 UART Brigde from i2c, support i2c_gpio alias in Raspberry Pi Zero device tree, but original DT code support only i2c_arm alias. 
This DT code is base  Theoi-Meteoroi/GPIO-pca9548 repository, but I edited some section DT code to support SC16IS752 driver over i2c-gpio alias. 

Instruction to install DT device.
1. Run in Raspberry Pi OS operation system.
### 2. Firstly step, you need to clone PiElectricsEaglesOS via git command. Run command folowing command
git clone https://github.com/Electrics-Eagles/PiElectricsEaglesOS.git
### 3. Go to directory follwing command. 
cd PiElectricsEaglesOS/devicetree/sc16is752-i2c-gpio
### 4. Change permission file dts_install.sh via chmod command.
sudo chmod 777 dts_install.sh
### 5. Run bash command to compile this device tree, but this command will automatically to generate DT binary file in directory /boot/overlays. You don't need to copy to essential directory
./dts_install.sh
### 6. Edit config.txt in directory /boot, add text following below text
dtoverlay=i2c-gpio,i2c_gpio_sda=19,i2c_gpio_scl=16

dtoverlay=sc16is752-i2c-gpio,int_pin=24
### 7. Reboot your Raspberry Pi Zero
sudo reboot
### 8. After rebooting Raspberry Pi Zero, your need to run command sudo modprobe and test that sc16is752 is worked following below
sudo modprobe i2c-dev

sudo modprobe i2c-bcm2835

sudo modprobe sc16is7xx

dmesg | grep i2c

dmesg | grep tty

ls /dev | grep tty

### 9. Enjoy!!! :)

