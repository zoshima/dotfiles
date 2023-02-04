#!/bin/bash

rm ~/git/dotfiles/.vimrc  ~/.vimrc || true
rm ~/git/dotfiles/.tmux.conf ~/.tmux.conf || true
rm ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml || true
rm ~/git/dotfiles/.gitconfig ~/.gitconfig || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
