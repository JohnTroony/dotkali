#!/bin/bash

maindir=$(pwd)
set $baseDir /root/.config/i3


# add more apt-sources
cp src/aptlists/* /etc/apt/sources.list.d/

# Update, Upgrade and Dist-upgrade Kali
dpkg -- add - architecture i386 
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt autoremove -y

# Install Personal apps and Kernel Headers
apt-get install build-essential clang gcc git gdb autotools-dev automake libtool texinfo
apt-get install conky tmux vim openvpn dia gthumb pulseaudio alsa-utils windows-binaries 
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
apt-get install dkms virtualbox-dkms
apt-get install virtualbox


# Install i3wm and related files
apt-get install i3 -y 
apt-get install i3lock i3status i3blocks -y
apt-get install dunst suckless-tools -y
apt-get install nitrogen gperf -y
apt-get install xautolock -y
apt-get install feh rofi pavucontrol -y
apt-get install lxappearance gnome-screenshot compton scrot -y
apt-get install devscripts arc-theme faba-icon-theme -y
apt-get install arandr playerctl  quilt -y
apt-get install freetype2-demos vflib3 libfreetype6-dev -y 


# Install Awesome and Yosemite San-Francisco Fonts
mkdir ~/.fonts
cp fonts/* ~/.fonts

# Install Moka Fonts
dpkg -i src/debs/moka-icons.deb

# Make i3 config directory and copy files
mkdir $baseDir
cp -rf resourcefiles/* $baseDir
cp -rf i3conf/*     $baseDir
cp resourcefiles/scripts/lock /usr/bin/lock



# Install IDA
mkdir temp && cd temp
wget https://out7.hex-rays.com/files/idafree70_linux.run
chmod +x idafree70_linux.run
./idafree70_linux.run

#Install Sublime
apt-get install sublime-text -y

#Install Skype
apt-get install skypeforlinux -y

# Install Libreoffice
apt-get install libreoffice -y

# Install Hexchat and others
apt-get install hexchat terminator firefox-esr nautilus -y


# GTK Config
cp -r GTKconfs/gtk-2.0/ $baseDir
cp -r GTKconfs/gtk-3.0/ $baseDir
cp GTKconfs/gtk-2.0 /root/.gtk-2.0


# More Post Installs
sed -i 's/geteuid/getppid/' /usr/bin/vlc
apt-get install network-manager
apt-get install network-manager-gnome
apt install network-manager-openvpn
apt install network-manager-vpnc
apt install network-manager-openconnect
apt install bluetooth
apt install blueman
apt install wxhexeditor
apt-get install apt-transport-https
code --user-data-dir="~/.vscode-root"


reboot
