#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "try: sudo $0 $*"
    exit 1
fi

systemctl stop auraoff.service
systemctl disable auraoff.service

rm /etc/systemd/system/auraoff.service
rm /etc/systemd/system/multi-user.target.wants/auraoff.service
rm /bin/auraoff.sh

cp /home/kdi/git/dotfiles/auraoff/auraoff.service /etc/systemd/system/auraoff.service
cp /home/kdi/git/dotfiles/auraoff/auraoff.sh /bin/auraoff.sh

systemctl enable auraoff.service
systemctl start auraoff.service
