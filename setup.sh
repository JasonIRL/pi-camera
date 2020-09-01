#!/bin/bash
#
set -e

make

sudo cp piwebcam.service /etc/systemd/system/
sudo systemctl enable piwebcam

sudo sed -i 's/^console=\(.*\)$/\1 modules-load=dwc2,libcomposite/' /boot/cmdline.txt

printf "\ndtoverlay=dwc2\n" | sudo tee -a /boot/config.txt

sudo ln -s /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@ttyGS0.service