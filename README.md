## Macbook Air Fixes

    $ ./mba-fix.sh

## Installation

    $ cd pragmatt && ./install.sh


## Config Wireless Hotpot

    $ iwlist <interface> scan | grep -i essid
    $ wpa_supplicant <ESSID> <PASSORD> > wifi.conf
    $ wpa_supplicant -Dwext -i<interface> -c$HOME/wifi.conf
    $ iwconfig <interface> essid "xxxx"
    $ dhclient <interface>
    $ ifconfig <interface> up/down

## Integrate Wechat with Irssi:

> please refer => https://github.com/sjdy521/Mojo-Weixin

## SoftEther VPN server installation

- https://www.softether.org/4-docs/1-manual
- please refer => https://www.softether.org/4-docs/1-manual/7._Installing_SoftEther_VPN_Server/7.3_Install_on_Linux_and_Initial_Configurations
- http://softether-download.com/en.aspx


