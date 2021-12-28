#!/usr/bin/env bash
set -euo pipefail

echo "
# -----------
# Preparation
# -----------"
sudo -i
echo 'pragmatt ALL=(ALL:ALL) ALL' >> /etc/sudoers
sudo usermod -a -G wheel pragmatt

echo "
# -------------------
# Install AliYun Repo
# Optional: remove hourly yum cron; modify /etc/yum/yum-cron.conf to set 
#     update_cmd=security and apply_updates=yes.
# Use http://mirrors.aliyun.com for base, updates, and epel repos.
# -------------------"
# sudo yum install -y wget
# sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sudo yum install -y epel-release network-scripts net-tools
sed -e 's|^metalink=|#metalink=|g' \
    -e 's|^#baseurl=https://download.example/pub|baseurl=https://mirrors.aliyun.com|g' \
    -i.bak \
    /etc/yum.repos.d/epel*.repo
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=http://mirrors.aliyun.com/rockylinux|g' \
    -i.bak \
    /etc/yum.repos.d/Rocky-*.repo
sudo yum clean all
sudo yum makecache
sudo yum update -y

echo "
# ------------
# Install Deps
# ------------"
#sudo yum install -y epel-release deltarpm yum-cron openssl-devel
sudo yum install -y ghc libXpm-devel.x86_64  haskell-platform gnutls-devel libgsasl-devel libxml2-devel zlib-devel ghc-zlib-devel libidn-devel
sudo yum install -y cabal-install ghc-X11 ghc-X11-devel ghc-X11-xft ghc-X11-xft-devel
sudo yum install -y dmenu xclip

echo "
# -----------
# Install X11
# -----------"
#sudo yum groupinstall -y "GNOME Desktop"
#sudo yum groupinstall -y base core dail-up fonts directory-client input-methods internet-browser java-platform guest-agents guest-desktop-agents multimedia network-file-system-client networkmanager-submodules
#sudo yum install -y xorg-x11-server-Xorg xorg-x11-utils xorg-x11-xauth xorg-x11-xinit
#sudo systemctl set-default graphical.target
#sudo systemctl disable gdm
#dnf install -y xfdesktop xfce4-{session,settings,terminal}


echo "
# -----------
# Install GIT
# -----------"
sudo yum install -y git
ln -sf $PWD/gitconfig $HOME/.gitconfig

echo "
# -----------------
# Install OH My ZSH
# -----------------"
sudo yum install -y zsh
rm -rf $HOME/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -sf $PWD/zshrc $HOME/.zshrc
#sudo chsh -s $(which zsh) && exit 0

echo "
# -------------
# Install Fonts
# -------------"
mkdir -p $HOME/.fonts
ln -sf $PWD/fonts $HOME/.fonts
fc-cache -f -v

echo "
# --------------
# Install Xmobar
# --------------"
<<<<<<< HEAD
pushd $PWD
rm -rf /tmp/xmobar
git clone git://github.com/jaor/xmobar /tmp/xmobar
cd /tmp/xmobar
sudo runhaskell setup.lhs configure --flags="with_utf8"
sudo runhaskell setup.lhs configure --flags="with_xft"
sudo runhaskell setup.lhs build
sudo runhaskell setup.lhs install
popd
#cabal update
#cabal install c2hs

echo "
# --------------
# Install XMonad
# --------------"
sudo yum install -y xmonad xmonad xmonad-contrib-devel
mkdir -p $HOME/.xmonad
ln -sf $PWD/xmonad/bin $HOME/.xmonad/bin
ln -sf $PWD/xmonad/wallpaper $HOME/.xmonad/wallpaper
ln -sf $PWD/xmonad/xmobar.hs $HOME/.xmonad/xmobar.hs
ln -sf $PWD/xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs

echo "
# ---------------
# Install Xinitrc
# ---------------"
sudo yum install -y rxvt-unicode-ml
ln -sf $PWD/Xresources $HOME/.Xresources
ln -sf $PWD/xinitrc $HOME/.xinitrc
sudo localedef -v -c -i en_US -f UTF-8 en_US.UTF-8

echo "
# --------------
# Install System
# --------------"
ln -sf $PWD/motd $HOME/.motd
ln -sf $PWD/alias $HOME/.alias
ln -sf $PWD/inputrc $HOME/.inputrc

echo "
# ------------
# Install Mutt
# ------------"
sudo yum install -y mutt maildrop fetchmail
ln -sf $PWD/muttrc $HOME/.muttrc
ln -sf $PWD/mutt $HOME/.mutt
ln -sf $PWD/mutt $HOME/.mutt
cp $PWD/fetchmailrc $HOME/.fetchmailrc
cp $PWD/mailfilter $HOME/.mailfilter

echo "
# -------------
# Install Irssi
# -------------"
sudo yum install -y irssi 
ln -sf $PWD/irssi $HOME/.irssi


echo "
# ---------------
# Install Xmodmap
# ---------------"
ln -sf $PWD/Xmodmap $HOME/.Xmodmap

echo "
# ------------
# Install Tmux
# ------------"
sudo yum install -y tmux 
ln -sf $PWD/tmux.conf $HOME/.tmux.conf

echo "
# -----------
# Install Vim
# -----------"
sudo yum install -y vim
rm -rf $HOME/.vim
git clone https://github.com/tim-tang/vimfiles.git $HOME/.vim
pushd $PWD
cd $HOME/.vim && ./install.sh
popd

echo "
# ----------------------------------------------------------
# Install XL2TP & IPsec
# Attention: modfiy /usr/lib/systemd/system/xl2tpd.service
# Uncomment section:
# Wants=ipsec.service
# ----------------------------------------------------------"
sudo yum install -y libreswan xl2tpd ppp
sudo ln -sf $PWD/switchvpn /usr/local/bin/switchvpn

echo "
# ----------------------
# Install Wireless Tools
# ----------------------"
sudo yum install -y wireless-tools


echo "
# ---------------------
# Install Google Chrome
# ---------------------"
sudo bash -c 'cat > /etc/yum.repos.d/google-chrome.repo <<EOF
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=0
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF'
sudo yum install -y google-chrome-stable

echo "
# -----------
# Install Feh
# -----------"
sudo yum install -y libXt-devel imlib2-devel libcurl-devel libpng-devel libX11 libXinerama
pushd $PWD
#rm -rf $HOME/playground/feh
#git clone https://github.com/derf/feh.git $HOME/playground/feh
cd $HOME/playground/feh
make
sudo make install app=1
popd

echo "
# -----------------
# Install xcompmgr
# Please refer => http://www.voidcn.com/blog/jxm_csdn/article/p-6168328.html
# -----------------"
sudo yum install -y perl-Data-Dumper.x86_64 autoconf.noarch perl-Thread-Queue.noarch perl-Test-Harness.noarch automake.noarch libtool-ltdl-devel.x86_64 xorg-x11-xtrans-devel.noarch xorg-x11-util-macros.noarch libXcomposite-devel.x86_64
pushd $PWD
rm -rf $HOME/playground/xcompmgr
git clone https://anongit.freedesktop.org/git/xorg/app/xcompmgr.git $HOME/playground/xcompmgr
cd $HOME/playground/xcompmgr
./autogen.sh
make
sudo make install
popd

echo "=>> Finised To Setup Pragmatt Env! orz orz ......" 
