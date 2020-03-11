# macos
## homebrew
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## shell
### oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### packages
#### cli
```sh
zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting
```

#### casks
```sh
iterm2
```

```sh
tap homebrew/cask-fonts
font-fira-code
```

### links
```sh
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/zoshima.zsh-theme ~/.oh-my-zsh/themes/zoshima.zsh-theme
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
```

### manual
- import ~/git/dotfiles/zoshima.iterm-profile.json as profile in iterm2

## nvim

### vim-plug
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### packages
#### brew
```sh
neovim
fzf
```

#### other
```sh
pip3 install neovim
yarn global add neovim
```

### links
#### core
```sh
ln -s ~/git/dotfiles/nvim/init.vim ~/.config/nvim/init.vim 
```

```
:PlugInstall
```

#### typescript
#### brew
```sh
yarn
prettier
```

#### yarn
```sh
typescript
```

#### links
```sh
ln -s ~/git/dotfiles/nvim/init.ts.vim ~/.config/nvim/init.ts.vim 
ln -s ~/git/dotfiles/nvim/init.coc.vim ~/.config/nvim/init.coc.vim 
ln -s ~/git/dotfiles/coc-config.json ~/.config/nvim/coc-settings.json
```

```
:PlugInstall
:UpdateRemotePlugins
:CocInstall coc-json coc-css coc-tsserver
```

#### cs
```sh
ln -s ~/git/dotfiles/nvim/init.cs.vim ~/.config/nvim/init.cs.vim 
```

```
:PlugInstall
:UpdateRemotePlugins
```

# windows
## terminal
install microsoft terminal

## nvim
install python with pip

```sh
pip install neovim
```

download compiled binaries from https://github.com/neovim/neovim/wiki/Installing-Neovim

extract to ``C:\Program Files\Neovim``

add ``C:\Program Files\Neovim\bin`` to path

add init.vim to ``%userprofile%\AppData\Local\nvim\``

change some paths in init.vim:
```vim
call plug#begin('~/AppData/Local/nvim/plugged')
if !empty(glob("~/AppData/Local/nvim/init.coc.vim"))
if !empty(glob("~/AppData/Local/nvim/init.ts.vim"))
if !empty(glob("~/AppData/Local/nvim/init.cs.vim"))
```

open nvim.init and run
```vim
:PlugInstall
:UpdateRemotePlugins
:CocInstall coc-json coc-css coc-tsserver
```