## Installation

    $ cd pragmatt && ./install.sh

## Macbook Air Fixes

    $ ./mba-fix.sh

## Config Wireless Hotpot

    $ iwlist <interface> scan | grep -i essid
    $ wpa_supplicant <ESSID> <PASSORD> > wifi.conf
    $ wpa_supplicant -Dwext -i<interface> -c$HOME/wifi.conf
    $ iwconfig <interface> essid "xxxx"
    $ dhclient <interface>
    $ ifconfig <interface> up/down

> Don't forget to change password in .fetchmailrc

## Integrate Wechat with Irssi:

please refer => https://github.com/sjdy521/Mojo-Weixin
