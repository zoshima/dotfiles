#!/bin/bash

rm  ~/.vimrc || true
rm  ~/.gitconfig || true
rm  ~/.bashrc || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.bashrc ~/.bashrc
