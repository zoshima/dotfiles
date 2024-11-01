#!/bin/bash
pushd ~/git/dotfiles
git submodule init
git submodule update
popd

rm -rf ~/.config/nvim || true

mkdir -p ~/.config/nvim/pack/git/

ln -s ~/git/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/git/dotfiles/nvim/lua ~/.config/nvim/lua
ln -s ~/git/dotfiles/nvim/plugins ~/.config/nvim/pack/git/start

nvim ~/.config/nvim/init.lua
