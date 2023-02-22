#!/bin/bash

rm  ~/.vimrc || true
rm  ~/.gitconfig || true
rm  ~/.config/fish/config.fish || true

ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/config.fish ~/.config/fish/config.fish
