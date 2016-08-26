## Install dependency libs

    $ sudo yum install xmonad xmonad xmonad-contrib-devel xmobar feh dmenu xcompmgr mutt fetchmail irssi promail tmux zsh xclip
    $ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    $ sudo chsh -s /bin/zsh 
    
## Install Vim

> Please refer: _https://github.com/tim-tang/vimfiles_

## Install Dotfiles

    $ git clone https://github.com/tim-tang/pragamtt.git
    $ cd pragmatt && cp -r * $HOME/
    $ sudo chmod 700 $HOME/.fetchmailrc
    $ mv $HOME/xmonad $HOME/.xmonad 


> Don't forget to change password in .fetchmailrc
