# macos
# cleanup
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.Finder QuitMenuItem 1
killall Dock

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
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/zoshima.zsh-theme ~/.oh-my-zsh/themes/zoshima.zsh-theme
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
```

### cscreen
cscreen -l
cscreen -s 1c81b4cd -x 3840 -y 1080 -r 144

## nvim

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```sh
brew install neovim --HEAD
```

```sh
ln -s ~/git/dotfiles/nvim/init.vim ~/.config/nvim/init.vim 
```

```
:PlugInstall
```

### typescript
```sh
yarn global add typescript-language-server
```

### cs
download omnisharp-osx to ``~/.omnisharp``

```sh
find ~/.omnisharp | xargs xattr -r -d com.apple.quarantine
```

### rust
```sh
brew install rust-analyzer
```
