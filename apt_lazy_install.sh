#!/bin/bash

#Basic config#
DISTRO=$(lsb_release -c | awk '{print $2}';)

#Bring other ConfigFiles
. config/repos.inc

#Begin
echo "Updating APT-Cache"
apt-get update --allow-unauthenticated

#Install Apps
echo "Installing your applications"
apt-get install -y ssh aptitude vim zsh
. apt_vga_cards
. apt_desktop_environments
. apt_dev_tools
. apt_internet_apps
. apt_multimedia_apps
. apt_support_tools
. apt_tools

#Upgrade all system
echo "Upgrading system"
apt-get upgrade -y

#Remove boring things (At least form me They are :p )
echo "Unable other packages"
. apt_remove_unsused_packages