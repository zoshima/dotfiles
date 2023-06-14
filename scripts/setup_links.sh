#!/bin/bash

rm  ~/.vimrc || true
rm  ~/.gitconfig || true
rm  ~/.bashrc || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.bashrc ~/.bashrc

rm ~/.config/Code\ -\ OSS/User/keybindings.json
rm ~/.config/Code\ -\ OSS/User/settings.json

ln -s ~/git/dotfiles/vscode/keybindings.json ~/.config/Code\ -\ OSS/User/
ln -s ~/git/dotfiles/vscode/settings.json ~/.config/Code\ -\ OSS/User/
