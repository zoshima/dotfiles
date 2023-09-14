#!/bin/bash

rm  ~/.vimrc || true
rm  ~/.gitconfig || true
rm  ~/.bashrc || true
rm  ~/.alacritty.yml || true
rm  ~/.tmux.conf || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.bashrc ~/.bashrc
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
