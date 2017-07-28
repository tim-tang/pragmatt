#!/bin/sh
# Script to configure X, start common apps, and start xmonad.
# Author: Vic Fryzel
# http://github.com/vicfryzel/xmonad-config

if [ -d /etc/X11/xinit/xinitrc.d/ ];
then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ]  && . "$f"
    done
    unset f
fi

# Configure PATH so that we can access our scripts below
PATH=$PATH:~/.cabal/bin:~/.xmonad/bin

# Configure IBus
export LANG=en_US.UTF-8
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE=ibus
export GTK_IM_MODULE=ibus
ibus-daemon --xim -d
#ibus engine libpinyin


# Configure X
xsetroot -cursor_name left_ptr &
xrdb -merge ~/.Xdefaults &
setxkbmap -option "ctrl:nocaps" &

# Start a window compositor. This ensures Google Chrome paints correctly.
xcompmgr -n &

# Start the system tray
tray &

# Start sound server
pulseaudio --start --log-target=syslog &

exec xmonad
