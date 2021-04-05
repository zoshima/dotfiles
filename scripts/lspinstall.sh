#!/bin/bash

NPM_PKG=(
  "typescript"
  "typescript-language-server"
  "eslint_d"
  "prettier"
  "vim-language-server"
  "bash-language-server"
)

BREW_PKG=(
  "rust-analyzer"
  "efm-langserver"
)

# omnisharp has to be downloaded manually

echo "installing yarn packages..."
yarn global add ${NPM_PKG[@]}

echo "installing homebrew packages..."
brew install ${BREW_PKG[@]}

echo "fin"
