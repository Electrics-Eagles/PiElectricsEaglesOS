#!/bin/bash
sudo dtc -W no-unit_address_vs_reg -I dts -O dtb -@ -o /boot/overlays/sc16is752-i2c-gpio.dtbo ./sc16is752-i2c-gpio.dts
