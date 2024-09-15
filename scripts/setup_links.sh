#!/bin/bash

mkdir -p ~/.local/bin/

rm ~/.gitconfig || true
rm ~/.bashrc || true
rm ~/.toprc || true
# rm ~/.vimrc || true
# rm  ~/.alacritty.toml || true
# rm  ~/.tmux.conf || true

ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.bashrc ~/.bashrc
ln -s ~/git/dotfiles/.toprc ~/.toprc
# ln -s ~/git/dotfiles/.vimrc ~/.vimrc
# ln -s ~/git/dotfiles/.alacritty.toml  ~/.alacritty.toml
# ln -s ~/git/dotfiles/.tmux.conf  ~/.tmux.conf
