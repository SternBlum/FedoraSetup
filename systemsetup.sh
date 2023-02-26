#!/usr/bin/bash

# Enabling the third-party repos, as well as enabling the flags 'fastestmirror= true' and 'max_parallel_downloads = 10' on the dnf.conf file.

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo 'fastestmirror = true' | sudo tee -a /etc/dnf/dnf.conf
sleep 3
echo 'max_parallel_downloads = 10' | sudo tee -a /etc/dnf/dnf.conf
# Refreshing the repos
sudo dnf update --refresh


echo "First, take a look at the following options:
[ 1 ] Install add-ons for the GNOME desktop environment, as well as my preferred applications;
[ 2 ] Install add-ons for the KDE Plasma desktop environment, as well as my preferred applications;
[ 3 ] Install no add-ons, just my preferred applications;
[ 4 ] None of the above."

read -p "Choose your option : " option

if [ $option = 1 ]; then
        sudo dnf install qutebrowser zsh neovim neofetch gnome-tweaks gnome-shell-extension-pop-shell xprop lutris xdelta qbittorrent piper vlc vlc-bittorrent mpv obs-studio kdenlive telegram-desktop zenity openssl libvterm libvterm-devel steam -y
elif [ $option = 2 ]; then
        sudo dnf install zsh kate flatpak qutebrowser neovim neofetch bismuth kate xprop lutris xdelta qbittorrent piper vlc vlc-bittorrent mpv obs-studio kdenlive telegram-desktop zenity openssl libvterm libvterm-devel steam -y
elif [ $option = 3 ]; then
        sudo dnf install zsh kate flatpak qutebrowser neovim neofetch xprop lutris xdelta qbittorrent piper vlc vlc-bittorrent mpv obs-studio kdenlive telegram-desktop zenity openssl libvterm libvterm-devel steam -y
elif [ $option = 4 ]; then
        echo "Moving forward.."
else
        echo "Error."
fi

echo "Multimedia codecs are desireable for consuming media across the internet, etc. Would you like to install it?
[ 1 ] Yes;
[ 2 ] No."

read -p "Choose your option: " option1
if [ $option1 = 1 ]; then
        sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel && sudo dnf install lame\* --exclude=lame-devel && sudo dnf group upgrade --with-optional Multimedia
elif [ $option1 = 2 ]; then
        echo "Moving forward.."
fi

echo "All done with the codecs."

echo "Installing virtualization software and enabling system services."

sleep 2
sudo dnf install @virtualization
sleep 2
sudo dnf group install --with-optional virtualization
sleep 2
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "Successfully installed!"
