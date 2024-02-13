#!/bin/bash

mkdir -p ~/.local/bin/

rm  ~/.vimrc || true
rm  ~/.gitconfig || true
rm  ~/.bashrc || true
rm ~/.local/bin/checkupdates.sh || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.bashrc ~/.bashrc
ln -s ~/git/dotfiles/scripts/checkupdates.sh ~/.local/bin/checkupdates.sh
