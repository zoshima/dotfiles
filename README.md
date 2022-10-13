# windows (wsl)
## Xming
### .profile
```
DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0
```

### choco
```
choco install alacritty win32yank
```

# macos
## cleanup
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.Finder QuitMenuItem 1
killall Dock

## homebrew
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## shell
### fish
```sh
ln -s ~/git/dotfiles/config.fish ~/.config/fish/config.fish
```

#### casks
```sh
alacritty
tmux
```

```sh
tap homebrew/cask-fonts
font-fira-code
```

### links
```sh
ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
```

### cscreen
cscreen -l
cscreen -s 1c81b4cd -x 3840 -y 1080 -r 144

## nvim

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```packages
neovim
rg
```

```sh
ln -s ~/git/dotfiles/nvim/init.lua ~/.config/nvim/init.lua 
ln -s ~/git/dotfiles/nvim/lua ~/.config/nvim/lua
```

```
:PackerSync
```
