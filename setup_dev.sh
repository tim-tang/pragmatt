#!/usr/bin/env bash

echo "
# ------------------
# Install Dev Deps
# -----------------"
mkdir -p $HOME/bin
sudo yum install -y atlas-devel boost-devel clang cmake gcc-c++ git gtest-devel java-1.8.0-openjdk-devel lapack-devel libevent-devel meld numpy python-devel python-ipython-console python-unittest2 pytz scipy swig thrift-devel xz-devel strace valgrind mysql-devel MySQL-python maven thrift python-thrift aerospike-client-c-devel ipython

echo "
# --------------
# Install VPNC
# --------------"
sudo yum install -y vpnc
wget http://svn.unix-ag.uni-kl.de/vpnc/trunk/pcf2vpnc
chmod +x pcf2vpnc 
sudo mv pcf2vpnc /usr/local/bin/
# test cisco-decrpt existence
cisco-decrypt -h 

echo "
# -------------
# Install Utils
# -------------"
sudo yum install -y curl doxygen graphviz htop mercurial psmisc screen s3cmd gdb ntp axel

echo "
# ----------------
# Install Arcanist
# ----------------
"
sudo yum install -y php-cli
pushd $PWD
cd /opt
sudo git clone https://github.com/phacility/arcanist.git
sudo git clone https://github.com/phacility/libphutil.git
sudo ln -s /opt/arcanist/bin/arc /usr/bin/arc
arc set-config editor "/usr/bin/vim"
popd

echo "
# --------------
# Install WeChat
# --------------
# Not implemented!
"


echo "
# -------------------
# Install MPV Player
# -------------------"
sudo yum install -y yasm fribidi youtube-dl freetype-devel fribidi-devel fontconfig-devel harfbuzz-devel cmake mercurial nasm openssl-devel libX11-devel python-docutils luajit-devel libbluray-devel libdvdread-devel libcdio-paranoia-devel lcms2-devel pulseaudio-libs-devel jack-audio-connection-kit-devel alsa-lib-devel libdrm-devel libxkbcommon-devel libXScrnSaver-devel libXext-devel libXv-devel PyQt4-devel libvdpau-devel libva-devel gstreamer1-vaapi-devel libcaca-devel
pushd $PWD
rm -rf $HOME/playground/mpb-build
git clone https://github.com/mpv-player/mpv-build.git $HOME/playground/mpb-build
cd $HOME/playground/mpb-build
echo --enable-openssl >> ffmpeg_options
echo --enable-nonfree >> ffmpeg_options
sudo ./rebuild -j4
sudo ./install
popd


echo "
# --------------
# Clean up a bit
# --------------"
sudo yum remove -y --remove-leaves abrt-libs audit chrony dyninst* firewalld kexec-tools libfprint libreport* lvm2 selinux* sos policy*
sudo systemctl stop gdm
sudo systemctl stop lvm2-monitor
sudo systemctl stop lvm2-lvmetad
sudo systemctl disable gdm
sudo systemctl disable lvm2-monitor
sudo systemctl disable lvm2-lvmetad
sudo systemctl disable firewalld
sudo yum remove -y selinux-policy

echo "=>> Bingoo! orz orz orz ......"
