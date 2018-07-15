# VIM for Angular and .NET Core development on MacOS
## Prerequisites
### MacVim
```sh
brew install macvim --with-override-system-vim --with-python@2
```

Python 2.x is required by the ``OmniSharp-vim`` plugin.
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
Download ``omnisharp.http-osx`` from https://github.com/OmniSharp/omnisharp-roslyn/releases and extract to ``~/omnisharp`` folder.

### Typescript server
```sh
npm i -g typescript
```

## Installation
```vim
:PluginInstall
```
```sh
cd ~/.vim/bundle/YouCompleteMe
./install.py
```