#!/usr/bin/env bash


echo "
# ------------------
# Install Dev Pkgs
# -----------------
"

# Install maven
sudo yum install -y maven

# Install dev
sudo yum install -y atlas-devel boost-devel clang cmake gcc-c++ git gtest-devel java-1.8.0-openjdk-devel lapack-devel libevent-devel meld numpy python-devel python-ipython-console python-unittest2 pytz scipy swig thrift-devel xz-devel strace valgrind mysql-devel MySQL-python

# Install Thrift
sudo yum install -y thrift python-thrift

# Install aerospike cli
sudo yum install -y openssl-devel aerospike-client-c-devel

# Install ipython
sudo yum install -y ipython

# Install VPNC
sudo yum install -y vpnc
wget http://svn.unix-ag.uni-kl.de/vpnc/trunk/pcf2vpnc
chmod +x pcf2vpnc 
sudo mv pcf2vpnc /usr/local/bin/
# test cisco-decrpt existence
cisco-decrypt -h 

# Install utils
sudo yum install -y curl doxygen graphviz htop mercurial psmisc screen s3cmd gdb ntp axel

# Clean up a bit.
sudo yum remove -y --remove-leaves abrt-libs audit chrony dyninst* firewalld kexec-tools libfprint libreport* lvm2 selinux* sos policy*

sudo systemctl stop lvm2-monitor
sudo systemctl disable lvm2-monitor
sudo systemctl stop lvm2-lvmetad
sudo systemctl disable lvm2-lvmetad

echo "Bingooo......"
