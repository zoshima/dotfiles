#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "must be run as root"
	exit
fi

rm ~/git/dotfiles/.i3status.conf  ~/.i3status.conf || true
rm ~/git/dotfiles/config ~/.config/i3/config || true

mkdir -p ~/.config/i3

ln -s ~/git/dotfiles/.i3status.conf  ~/.i3status.conf
ln -s ~/git/dotfiles/config ~/.config/i3/config

# echo "kdi ALL=NOPASSWD: /usr/bin/systemctl suspend" > /etc/sudoers.d/09_nopasswd
sudo systemctl enable ~/git/dotfiles/suspend.service
sudo systemctl start suspend.service
