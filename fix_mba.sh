#!/usr/bin/env bash


# Prep wl mod installation
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/rhel7-mba.repo https://s3.amazonaws.com/atodorov/rpms/macbook/el7/rhel7-macbook.repo

# Wireless driver
sudo yum --showdup list kmod-wl
sudo yum install kmod-wl-6.30.223.248-10.el7
sudo modprobe wl
sudo lsmod|grep wl

# Fix Display backlight 
sudo yum install kmod-mba6x_bl-20161201.055d50d-1.el7
sudo modprobe mba6x_bl

# Install light
sudo yum install -y help2man
pushd
git clone https://github.com/haikarainen/light.git /tmp/light
cd /tmp/light
sudo make 
sudo make install
popd

# Fixing keyboard mapping
# More: systemctl status mba-kbd-fix
sudo yum install mba-kbd-fix
