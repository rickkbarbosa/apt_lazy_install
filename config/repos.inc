#Apt_keys

#Birdie - Twitter Client
#Birdie is a Twitter Client. Actually - my opinion - Hotot is coolest than Birdie, but as your choice.
if [[ $DISTRO -eq "saucy" || $DISTRO -eq "petra" || $DISTRO -eq "qiana" || $DISTRO -eq "trusty"  ]]; then
    echo "deb http://ppa.launchpad.net/birdie-team/stable/ubuntu raring main" > /etc/apt/sources.list.d/birdie-team-stable-${DISTRO}.list
else
    add-apt-repository ppa:birdie-team/stable -y
fi      

#Diodon Clipboard Manager
    add-apt-repository ppa:diodon-team/stable -y

#Gnome3 - Just when Distro isn't Ubuntu 14.04 and above
if [[ $DISTRO -ne "trusty" || $DISTRO -ne "qiana" ]]; then
    add-apt-repository ppa:webupd8team/gnome3 -y
fi

#Cinnamon Desktop - A Environment desktop based on Gnome 3
	add-apt-repository -y ppa:lestcape/cinnamon

#Grive - A Google Drive directory sync
add-apt-repository -y ppa:thefanclub/grive-tools

## Depôt MultiSystem - Figure out a USB Stick with VARIOUS OSes. Yeah, It's possible :D
if [[ $DISTRO -eq "maya" || $DISTRO -eq "nadia" || $DISTRO -eq "olivia" || $DISTRO -eq "petra" || $DISTRO -eq "trusty" || $DISTRO -eq "qiana" ]]; then
    echo "deb http://liveusb.info/multisystem/depot all main" >> /etc/apt/sources.list.d/depot_multisystem.list
    wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -
fi

#Nemo File Manager
    add-apt-repository ppa:webupd8team/nemo -y

#NVIDIA Video Drivers
if [[ $DISTRO -eq "trusty" || $DISTRO -eq "nadia" || $DISTRO -eq "saucy" || $DISTRO -eq "raring" || $DISTRO -eq "petra" || $DISTRO -eq "olivia" || $DISTRO -eq "quantal" ]]; then
    #Nvidia Drivers - 12.10 (quantal) and latests
    apt-add-repository ppa:xorg-edgers/ppa -y
elif [[ $DISTRO -eq "precise" || $DISTRO -eq "maya" ]]; then
    #Nvidia Drivers - 12.04 LTS
    apt-add-repository ppa:ubuntu-x-swat/x-updates -y
fi

#Phablet Tools
add-apt-repository ppa:phablet-team/tools -y
add-apt-repository ppa:kubuntu-ppa/backports -y

#PlayOnLinux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list

#Rhythmbox extra plugins
add-apt-repository ppa:fossfreedom/rhythmbox-plugins -y
    #Google Music Rhythmbox 
    if [[ $$DISTRO -eq "trusty" || DISTRO -eq "saucy" || $DISTRO -eq "raring" || $DISTRO -eq "petra" || $DISTRO -eq "olivia" ]]; then
            add-apt-repository ppa:nvbn-rm/ppa -y
    fi

##Sublime Text
    #If you prefer for any reason use SublimeText2 instead of SublimeText3, comment the next line and uncomment the after line. Also remember to change "apt-get install -y sublime-text-installer" to "apt-get install -y sublime-text"
    add-apt-repository ppa:webupd8team/sublime-text-3 -y
    #add-apt-repository ppa:webupd8team/sublime-text-2 -y

#TOR Browser
add-apt-repository ppa:webupd8team/tor-browser -y

#Ubuntu Tweak
add-apt-repository ppa:tualatrix/ppa -y

#VirtualBox
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
#Publishing new Repositories
#Setting VBox distro compatibility between Mint and Ubuntu
if [[ $DISTRO -eq "qiana" ]]; then VBOX_DISTRO="trusty"; fi
if [[ $DISTRO -eq "petra" ]]; then VBOX_DISTRO="saucy"; fi
if [[ $DISTRO -eq "olivia" ]]; then VBOX_DISTRO="raring"; fi
if [[ $DISTRO -eq "nadia" ]]; then VBOX_DISTRO="quantal"; fi
if [[ $DISTRO -eq "maya" ]]; then VBOX_DISTRO="precise"; fi
echo "deb http://download.virtualbox.org/virtualbox/debian ${VBOX_DISTRO} contrib" >> /etc/apt/sources.list.d/oracle_virtualbox.list

#PHP 5.5 & Apache 2.4
add-apt-repository ppa:ondrej/php5 -y
add-apt-repository ppa:ptn107/apache -y

#New multimedia repo
if [[ $DISTRO -eq "qiana" || $DISTRO -eq "trusty" ]]; then
	apt-add-repository -y ppa:mc3man/trusty-media;
fi

#Netflix / Alternative Pipelight installer
if [[ $DISTRO -ne "qiana "|| $DISTRO -ne "trusty" ]]; then
    apt-add-repository -y ppa:ehoover/compholio
fi

#Intel Drivers
add-apt-repository -y ppa:nilarimogard/webupd8
