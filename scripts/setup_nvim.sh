#!/bin/bash
rm  ~/.alacritty.yml || true
rm  ~/.tmux.conf || true

ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf

rm -rf ~/.config/nvim || true
rm -rf ~/.local/share/nvim/site/pack/packer || true

mkdir -p ~/.config/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim || true

ln -s ~/git/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/git/dotfiles/nvim/lua ~/.config/nvim/lua

nvim ~/.config/nvim/lua/plugins/init.lua
