#!/usr/bin/env bash
set -euo pipfail

# ========================
# Install sudoers without password
# ========================
#sudo -i
#echo '$USER ALL=(ALL:ALL) ALL' >> /etc/sudoers
sudo usermod -a -G wheel $USER

# ========================
# Install AliYun Repo
# ========================
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sudo yum clean all
sudo yum makecache
sudo yum update -y

# ========================
# Install Deps
# ========================
sudo yum install -y epel-release deltarpm yum-cron
sudo yum install -y ghc haskell-platform gnutls-devel libgsasl-devel libxml2-devel zlib-devel ghc-zlib-devel libidn-devel
sudo yum install -y cabal-install ghc-X11 ghc-X11-devel ghc-X11-xft ghc-X11-xft-devel
sudo yum install -y dmenu xclip


# ========================
# Install GIT
# ========================
sudo yum install -y git
ln -sf $PWD/gitconfig $HOME/.gitconfig

# ========================
# Install Fonts
# ========================
fc-cache $PWD/fonts

# ========================
# Install OH My ZSH
# ========================
sudo yum install -y zsh
rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $PWD/zshr $HOME/.zshrc
sudo chsh -s $(which zsh)

# ========================
# Install Xmonad
# ========================
sudo yum install -y xmonad xmonad xmonad-contrib-devel xmobar  
ln -sf $PWD/xmonad $HOME/.xmonad


# ========================
# Install Mutt & Fetch & Procmail
# ========================
sudo yum install -y mutt fetchmail procmail 
ln -sf $PWD/muttrc $HOME/.muttrc
ln -sf $PWD/fetchmailrc $HOME/.fetchmailrc
ln -sf $PWD/procmailrc $HOME/.procmailrc

# ========================
# Install Irssi
# ========================
sudo yum install -y irssi 
ln -sf $PWD/irssi $HOME/.irssi

# ========================
# Install Tmux
# ========================
sudo yum install -y tmux 
ln -sf $PWD/tmux.conf $HOME/.tmux.conf

# ========================
# Install Vim
# ========================
sudo yum install -y vim
rm -rf $HOME/.vim
git clone https://github.com/tim-tang/vimfiles.git $HOME/.vim
pushd $PWD
cd $HOME/.vim && ./install.sh
popd

# ========================
# Install MOTD
# ========================
ln -sf $PWD/motd $HOME/.motd

# ========================
# Install XL2TP & IPsec
# ========================
sudo yum install -y libreswan xl2tpd ppp

# ========================
# Install Wireless Tools
# ========================
sudo yum install -y wireless-tools

# ========================
# Install Xmobar
# ========================
cabal update
cabal install c2hs
cabal --force-reinstall install xmobar --flags="with_xft,with_utf8"


# ========================
# Install Feh
# ========================
sudo yum install -y libXpm-devel.x86_64 libXt-devel imlib2-devel libcurl-devel libpng-devel libX11 libXinerama
git clone https://github.com/derf/feh.git $HOME/playground/feh
pushd $PWD
rm -rf $HOME/playground/feh
cd $HOME/playground/feh
make
sudo make install app=1
popd

# ========================
# Install xcompmgr
# Please refer => http://www.voidcn.com/blog/jxm_csdn/article/p-6168328.html
# ========================
sudo yum install -y perl-Data-Dumper.x86_64 autoconf.noarch perl-Thread-Queue.noarch perl-Test-Harness.noarch automake.noarch libtool-ltdl-devel.x86_64 xorg-x11-xtrans-devel.noarch xorg-x11-util-macros.noarch libXcomposite-devel.x86_64
pushd $PWD
git clone https://anongit.freedesktop.org/git/xorg/app/xcompmgr.git $HOME/playground/xcompmgr
cd $HOME/playground/xcompmgr
./autogen.sh 
make 
sudo make install
popd

# ========================
# Install MPV Player
# ========================
sudo yum install -y yasm fribidi youtube-dl freetype-devel fribidi-devel fontconfig-devel harfbuzz-devel cmake mercurial nasm openssl-devel libX11-devel python-docutils luajit-devel libbluray-devel libdvdread-devel libcdio-paranoia-devel lcms2-devel pulseaudio-libs-devel jack-audio-connection-kit-devel alsa-lib-devel libdrm-devel libxkbcommon-devel libXScrnSaver-devel libXext-devel libXv-devel PyQt4-devel libvdpau-devel libva-devel gstreamer1-vaapi-devel libcaca-devel
pushd $PWD
git clone https://github.com/mpv-player/mpv-build.git $HOME/playground/mpb-build
cd $HOME/playground/mpb-build
echo --enable-openssl >> ffmpeg_options
echo --enable-nonfree >> ffmpeg_options
./rebuild -j4
./install
popd
