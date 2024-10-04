#!/bin/bash

mkdir -p ~/.local/bin/

rm ~/.gitconfig || true
rm ~/.bashrc || true
rm ~/.toprc || true
rm ~/.alacritty.toml || true
rm ~/.tmux.conf || true
# rm ~/.vimrc || true

ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.bashrc ~/.bashrc
ln -s ~/git/dotfiles/.toprc ~/.toprc
ln -s ~/git/dotfiles/.alacritty.toml ~/.alacritty.toml
ln -s ~/git/dotfiles/zellij ~/.config/zellij
# ln -s ~/git/dotfiles/.vimrc ~/.vimrc
# ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf

# rm -rf ~/.config/sway/ || true
# ln -s ~/git/dotfiles/sway ~/.config/
