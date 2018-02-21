#!/bin/sh
# Script to configure X, start common apps, and start xmonad.
# Author: Tim.Tang

if [ -d /etc/X11/xinit/xinitrc.d/ ];
then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ]  && . "$f"
    done
    unset f
fi



# Configure PATH so that we can access our scripts below
PATH=$PATH:~/.cabal/bin:~/.xmonad/bin

# Configure Timezone
export TZ='Asia/Shanghai'

# Configure IBus
# export TERM=rxvt-unicode-256color
export TERM=rxvt-unicode
export LANG=en_US.UTF-8
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export GTK_IM_MODULE=ibus
ibus-daemon --xim -d


# Configure X
xsetroot -cursor_name left_ptr &
xrdb -merge ~/.Xresources&
setxkbmap -option "ctrl:nocaps" &

# Start a window compositor. This ensures Google Chrome paints correctly.
# xcompmgr -n &
xcompmgr -cfF -t-9 -l-11 -r9 -o.75 -D3 &

# Start the system tray
# tray &

# Start sound server
pulseaudio --start --log-target=syslog &

# Start Firefox
# firefox &
google-chrome &

# Start WeChat
wechat &

exec xmonad
