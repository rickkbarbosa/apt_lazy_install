#!/bin/bash

#Basic config#
DISTRO=$(lsb_release -c | awk '{print $2}';)
SCRIPT_LOCATION=$(pwd;)

#Bring other ConfigFiles
. config/repos.inc

#Begin
echo "Updatin. config/apt-Cache"
#apt-get update --allow-unauthenticated

#Install Apps
echo "Installing your applications"
yum install -y openssh vim zsh wget tmux 
service sshd start
# . config/apt_vga_cards
. config/apt_desktop_environments
. config/apt_dev_tools
. config/apt_internet_apps
. config/apt_multimedia_apps
. config/apt_support_tools
. config/apt_tools
. config/apt_dev_php_mysql_environments

#Upgrade all system
echo "Upgrading system"
apt-get upgrade -y

#Remove boring things (At least form me They are :p )
echo "Unable other packages"
. config/apt_remove_unsused_packages
