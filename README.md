# VIM for Angular and .NET Core development on MacOS
## Prerequisites
### MacVim
```sh
brew cask install macvim
```

### Vundle
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### FZF
```sh
brew install fzf
```

### OmniSharp-Roslyn server
```sh
brew install mono
brew install libuv
```

Opening a .cs file for the first time will prompt for omnisharp-roslyn installation. 


### TypeScript server
```sh
npm i -g typescript
```

Note that the latest typescript might lead to some autocomplete issues.

## Installation
```sh
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/.vimrc ~/.vimrc
ln -s ~/git/dotfiles/.gvimrc ~/.gvimrc
``
```vim
:PluginInstall
```

Set the correct ```OmniSharp_server_path``` in vimrc.
