# VIM for Angular and .NET Core development on MacOS
## Prerequisites
### MacVim
~~brew install macvim --with-override-system-vim --with-python@2~~
~~Python 2.x is required by the ``OmniSharp-vim`` plugin.~~

Install the binary from https://github.com/macvim-dev/macvim/releases/tag/snapshot-149
### Vundle
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### FZF
```sh
brew install fzf
```

### Omnisharp-Roslyn server
```sh
brew install mono
brew install libuv
```

~~Download ``omnisharp.http-osx`` from https://github.com/OmniSharp/omnisharp-roslyn/releases and extract to ``~/omnisharp`` folder.~~

Opening a .cs file for the first time will prompt for omnisharp-roslyn installation.

### Typescript server
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
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.py
```
