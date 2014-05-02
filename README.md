apt_lazy_install
================

Ubuntu and Linux Mint Fast Installation.

Add APT repositories and some apps on Ubuntu / Linux Mint installation.

Supports Ubuntu and Linux Mint, Starting 12.04 LTS "Raring" or "Maya"


PACKAGES INCLUDED
=================

###### Development Tools
* ADB - Android development tools
* Heimdall - Android ROM Flasher
* git
* Man2Html - Browseable manpages
* Nagstamon - Nagios client
* Terminator - Multiple terminals
 
###### Emulation And Virtualization
* Play on Linux
* VirtualBox
* Wine
* Windows fonts

###### Environment
* Gnome
* Unity
* Xfce

###### Internet
* Dropbox
* OwnCloud
* Flash plugins
* Google Chrome
* Icedtea - Java plugin for Netbanking
* Birdie - A Twitter client
* Hotot - Another Twitter client

###### Multimedia
* Gstreamer codecs
* Rhythmbox plugins
* VLC Player

###### Productivity
* Alarm Clock
* Diodon - Clipboard manager
* Grive - Google Drive sync
* NEMO - File manager

###### Text Editors
* Sublime Text
* vim

###### Video Driver
* nvidia

###### Other Tools
* Conky
* ZSH
* Ubuntu-Tweak


INSTRUCTIONS
============

This script must run as root.
Important: If your VGA card IS NOT an Nvidia-based, comment the line containing "*apt-get install -y nvidia-current nvidia-settings*"

    git clone https://github.com/rickkbarbosa/apt_lazy_install.git
    chmod +x apt_lazy_install/apt_lazy_install.sh
    ./apt_lazy_install/apt_lazy_install.sh
