#!/bin/bash

#Basic config#
DISTRO=$(lsb_release -c | awk '{print $2}';)

#Getting Keys
#VirtualBox
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
#PlayOnLinux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list

#Publishing new Repositories
#VirtualBox
#Setting VBox distro compatibility
        if [[ $DISTRO -eq "petra" ]]; then VBOX_DISTRO="saucy"; fi
        if [[ $DISTRO -eq "olivia" ]]; then VBOX_DISTRO="raring"; fi
        if [[ $DISTRO -eq "maya" ]]; then VBOX_DISTRO="precise"; fi
echo "deb http://download.virtualbox.org/virtualbox/debian ${VBOX_DISTRO} contrib" >> /etc/apt/sources.list.d/oracle_virtualbox.list

#Add New PPA's
#Ubuntu Tweak
add-apt-repository ppa:tualatrix/ppa -y
##Sublime Text
        #If you prefer for any reason use SublimeText2 instead of SublimeText3, comment the next line and uncomment the after line. Also remember to change "apt-get install -y sublime-text-installer" to "apt-get install -y sublime-text"
add-apt-repository ppa:webupd8team/sublime-text-3 -y
#add-apt-repository ppa:webupd8team/sublime-text-2 -y
#Phablet Tools
add-apt-repository ppa:phablet-team/tools -y
add-apt-repository ppa:kubuntu-ppa/backports -y

#Gnome3 - Just when Distro isn't Ubuntu 14.04 and above
        if [[ $DISTRO -ne "trusty" ]] then
                add-apt-repository ppa:webupd8team/gnome3 -y
        fi
#Nemo File Manager
add-apt-repository ppa:webupd8team/nemo -y

#Rhythmbox extra plugins
add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y

#TOR Browser
add-apt-repository ppa:webupd8team/tor-browser -y

if [[ $DISTRO -eq "saucy" || $DISTRO -eq "raring" || $DISTRO -eq "petra" || $DISTRO -eq "olivia" ]] then
        #Nvidia Drivers - 12.10 (quantal) and latests
        apt-add-repository ppa:xorg-edgers/ppa -y
        #Google Music Rhythmbox 
        add-apt-repository ppa:nvbn-rm/ppa -y
        #Birdie - Twitter Client
        if [[ $DISTRO -eq "saucy" || $DISTRO -eq "petra" ]] then
                echo "deb http://ppa.launchpad.net/birdie-team/stable/ubuntu raring main" > /etc/apt/sources.list.d/birdie-team-stable-${DISTRO}.list
        else
                add-apt-repository ppa:birdie-team/stable -y
        fi
elif [[ $DISTRO -eq "precise" || $DISTRO -eq "maya" ]]; then
#Diodon Clipboard Manager
        add-apt-repository ppa:diodon-team/stable -y
#Grive - A Google Drive directory sync
        add-apt-repository ppa:nilarimogard/webupd8 -y
#Nvidia Drivers - 12.04 LTS
        apt-add-repository ppa:ubuntu-x-swat/x-updates -y
#Birdie - Twitter client
        add-apt-repository ppa:birdie-team/stable -y
fi


#Updating Packages
apt-get update --allow-unauthenticated

#Installing Packages
### First of All :)
apt-get install -y ssh aptitude vim zsh
apt-get install -y nvidia-current nvidia-settings

#### Devtools
apt-get install -y sublime-text-installer

#### Desktop 
if [[ $DISTRO -eq "petra" || $DISTRO -eq "olivia" || $DISTRO -eq "maya" ]]; then
        apt-get install -y xubuntu-desktop ubuntu-desktop gnome-session gnome-tweak-tool
        apt-get install -y cairo-dock cairo-dock-plugins
else
        apt-get install -y xubuntu-desktop gnome-shell gnome-shell-extensions gnome-tweak-tool
fi
apt-get install -y grive

#### Internet Add
apt-get install -y flashplugin-downloader curl pidgin pidgin-otr enigmail icedtea-7-plugin tor-browser hotot-qt birdie 
        #Google Chrome
        if [[ $(uname -m;) -eq "x86_64" ]]; then
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i google-chrome*; sudo apt-get -y install -f
                wget https://dl.google.com/linux/direct/google-talkplugin_current_i386.deb
                dpkg -i google-talkplugin_current_i386.deb; apt-get -y install -f
        else
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
                sudo dpkg -i google-chrome*; sudo apt-get -f install
                wget https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb
                dpkg -i google-talkplugin_current_amd64.deb; apt-get -y install -f
        fi
#### Multimedia
apt-get install -y phonon-backend-vlc vlc rhythmbox-plugin-complete ubuntu-restricted-extras libavcodec53
apt-get install -y gstreamer0.10-plugins-ugly gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad frei0r-plugins gstreamer0.10-plugins-bad-multiverse
sudo /usr/share/doc/libdvdread4/install-css.sh #Install dvd codecs
#GoogleMusic plugin for Rhythmbox
apt-get install -y rhythmbox-gmusic python-dateutil python-requests python-validictory
#### Work app
apt-get install -y nmap terminator git nagstamon man2html
#### Virtualyzing Tools
apt-get install -y wine ttf-mscorefonts-installer playonlinux dkms virtualbox-4.3
#### Smartphone Tools
apt-get install -y heimdall-flash heimdall-flash-frontend phablet-tools android-tools-adb android-tools-fastboot
###Other Aplications
apt-get install -y nemo nemo-fileroller nemo-compare nemo-dropbox nemo-media-columns nemo-seahorse nemo-share
apt-get install -y unrar unrar-free diodon alarm-clock alarm-clock-applet nautilus-dropbox owncloud-client conky-all

### Installing Ubuntu Tweak
#wget https://launchpad.net/ubuntu-tweak/0.8.x/0.8.5/+download/ubuntu-tweak_0.8.5-1_all.deb
#dpkg -i ubuntu-tweak_0.8.5-1_all.deb
apt-get install -y ubuntu-tweak

#Personalizing Environment
#Configuring OH-MY-ZSH
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
chsh -s /bin/zsh

#Upgrade System
apt-get upgrade -y

#Remove unused Unity lens
apt-get -y autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video
#Remove apport
apt-get remove -y apport
apt-get -y autoremove
