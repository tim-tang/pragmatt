#!/usr/bin/env bash

sudo wget -O /etc/yum.repos.d/rhel7-mba.repo https://s3.amazonaws.com/atodorov/rpms/macbook/el7/rhel7-macbook.repo

# Wireless driver
sudo yum install kmod-wl
sudo modprobe wl
sudo lsmod|grep wl

# Fix Display backlight 
sudo yum install kmod-mba6x_bl

# Fixing keyboard mapping
sudo yum install mba-kbd-fix
