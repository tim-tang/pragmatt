## Install dependency libs

    $ sudo yum install epel-release
    $ sudo yum install libXpm-devel.x86_64
    $ sudo yum install ghc libxml2-devel
    $ cabal install xmobar --flags="all_extensions"     
    $ sudo yum install xmonad xmonad xmonad-contrib-devel xmobar feh dmenu xcompmgr mutt fetchmail irssi promail tmux zsh xclip
    $ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    $ sudo chsh -s /bin/zsh 
    $ sudo yum install ghc cabal-install ghc-X11 ghc-X11-devel ghc-X11-xft ghc-X11-xft-devel

    
## Install Vim

> Please refer: _https://github.com/tim-tang/vimfiles_

## Install Dotfiles

    $ git clone https://github.com/tim-tang/pragamtt.git
    $ cd pragmatt && cp -r * $HOME/
    $ sudo chmod 700 $HOME/.fetchmailrc
    $ mv $HOME/xmonad $HOME/.xmonad 

## For CentOS7: * Build xcompmgr * Build Feh * Need to build xmobar by yourself with utf-8 and xfs flag
* Remove ibus (sudo yum remove ibus)
* Install fcitx with local repo (https://github.com/1dot75cm/myrepo) install cloudpinyin

## Install Wireless Tools

    $ sudo yum install wireless-tools
    $ iwlist <interface> scan | grep -i essid
    $ wpa_supplicant <ESSID> <PASSORD> > wifi.conf
    $ wpa_supplicant -Dwext -i<interface> -c$HOME/wifi.conf
    $ iwconfig <interface> essid "xxxx"
    $ dhclient <interface>
    $ ifconfig <interface> up/down

> Don't forget to change password in .fetchmailrc
