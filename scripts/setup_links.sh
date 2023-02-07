#!/bin/bash

rm  ~/.vimrc || true
rm  ~/.tmux.conf || true
rm  ~/.alacritty.yml || true
rm  ~/.gitconfig || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
