#!/bin/bash
rm -rf ~/.config/nvim || true

mkdir -p ~/.config/nvim/pack/git/

ln -s ~/git/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/git/dotfiles/nvim/lua ~/.config/nvim/lua

git clone https://github.com/nvim-treesitter/nvim-treesitter.git ~/.config/nvim/pack/git/start/nvim-treesitter

nvim ~/.config/nvim/init.lua
