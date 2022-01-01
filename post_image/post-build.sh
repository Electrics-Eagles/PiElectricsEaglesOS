CONFIG_TXT=./output/images/rpi-firmware/config.txt


# add config
cat > $CONFIG_TXT<< EOF
dtparam=i2c_arm=on
dtoverlay=i2c-gpio,bus=2,i2c_gpio_sda=19,i2c_gpio_scl=16
dtoverlay=i2c-gpio,bus=3,i2c_gpio_sda=22,i2c_gpio_scl=23
dtoverlay=i2c-gpio,bus=4,i2c_gpio_sda=26,i2c_gpio_scl=20
EOF



