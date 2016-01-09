cd /etc/yum.repos.d/


#apt_desktop_environments
wget http://download.opensuse.org/repositories/GNOME:/Ayatana/Fedora_17/GNOME:Ayatana.repo


#apt_dev_tools
	#PlayOnLinux	
	curl http://rpm.playonlinux.com/playonlinux.repo -o /etc/yum.repos.d/playonlinux.repo

    #VirtualBox
    cp ${SCRIPT_LOCATION}/config/yum_repos/virtualbox.repo . 

#apt_internet_apps
    #Birdie
    #Birdie is a Twitter Client. Actually - my opinion - Hotot is coolest than Birdie, but as your choice.
    wget http://download.opensuse.org/repositories/home:ivonunes/Fedora_20/home:ivonunes.repo



    #Google Chrome
    if [[ $(uname -m;) -eq "x86_64" ]]; then
          cp ${SCRIPT_LOCATION}/config/yum_repos/google-chrome/google-chrome-32.repo .
    else
          cp ${SCRIPT_LOCATION}/config/yum_repos/google-chrome/google-chrome-64.repo .
    fi

    #Chromium
    #wget https://repos.fedorapeople.org/spot/chromium/fedora-chromium-stable.repo
    cp ${SCRIPT_LOCATION}/config/yum_repos/google-chrome/chromium.repo .


#Multimedia_apps
    
    #Codecs
    yum localinstall y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm


#Tools
    #Dropbox
    cp ${SCRIPT_LOCATION}/config/yum_repos/dropbox.repo .


#Android Studio
    cp ${SCRIPT_LOCATION}/config/yum_repos/android-studio.repo . 


#Handbrake - Video Converter    
   cp ${SCRIPT_LOCATION}/config/yum_repos/fedora-handbrake.repo .

#Filebot
   cp ${SCRIPT_LOCATION}/config/yum_repos/filebot.repo .
cd ${SCRIPT_LOCATION}
