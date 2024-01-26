#!/bin/bash
sudo ln -s /home/kdi/git/dotfiles/services/auraoff.service /etc/systemd/system/auraoff.service
sudo systemctl enable auraoff.service
