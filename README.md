apt_lazy_install
================

Ubuntu and Linux Mint Fast Installation.

Add APT repositories and some apps on Ubuntu / Linux Mint installation.

Supports Ubuntu and Linux Mint, Starting 12.04 LTS "Raring" or "Maya"


PACKAGES INCLUDED
=================

#### Development Tools
* ADB - Android development tools
* Heimdall - Android ROM Flasher
* git
* mercurial
* subversion
* Man2Html - Browseable manpages
* Nagstamon - Nagios client
* Terminator - Multiple terminals
 
#### Emulation And Virtualization
* Play on Linux
* VirtualBox
* Wine
* Windows fonts

#### Environment
* Gnome
* Unity
* Xfce

#### Internet
* Dropbox
* OwnCloud
* Flash plugins
* Google Chrome
* Icedtea - Java plugin for Netbanking
* Birdie - A Twitter client
* Hotot - Another Twitter client

#### Multimedia
* Gstreamer codecs
* Rhythmbox plugins
* VLC Player

#### Productivity
* Alarm Clock
* Diodon - Clipboard manager
* Kingsoft Office - A Chinese Office Suite
* Grive - Google Drive sync
* NEMO - File manager

#### Text Editors
* Sublime Text
* vim

#### Video Driver
* Intel
* nvidia

#### PHP development environment (LAMP Server)
* Apache 2.4
* MySQL 5.5
* PHP 5.5.*
* PHP essential libs

###### PHP Essential Libs
* php5-mysql
* php5-apcu
* php5-curl
* php5-gd
* php5-json
* php5-mcrypt
* php5-memcached
* php5-readline
* dh-php5
* pkg-php-tools
* phpmyadmin

#### Other Tools
* Conky
* ZSH
* Ubuntu-Tweak
* MultiSystem - A Multiboot manager into USB Stick


INSTRUCTIONS
============

This script must run as root.
Important: This script actually supports Intel Graphics and Nvidia-based VGA Cards. If your VGA card IS NOT no one these, comment the lines on the section "*VGA Card*"

    git clone https://github.com/rickkbarbosa/apt_lazy_install.git
    chmod +x apt_lazy_install/apt_lazy_install.sh
    ./apt_lazy_install/apt_lazy_install.sh
