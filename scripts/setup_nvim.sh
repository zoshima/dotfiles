#!/bin/bash
rm -rf ~/.config/nvim || true

mkdir -p ~/.config/nvim

ln -s ~/git/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/git/dotfiles/nvim/lua ~/.config/nvim/lua

nvim ~/.config/nvim/lua/plugins/init.lua

# plugins

git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
git clone https://github.com/nvim-treesitter/nvim-treesitter.git ~/.config/nvim/pack/nvim/start/nvim-treesitter
git clone https://github.com/nvim-lua/plenary.nvim.git ~/.config/nvim/pack/nvim/start/plenary
git clone https://github.com/nvim-telescope/telescope.nvim.git ~/.config/nvim/pack/nvim/start/telescope
