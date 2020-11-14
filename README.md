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
ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/zoshima.zsh-theme ~/.oh-my-zsh/themes/zoshima.zsh-theme
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
```

### manual
- import ~/git/dotfiles/zoshima.iterm-profile.json as profile in iterm2

## nvim

### vim-plug
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### packages
#### brew
```sh
neovim
```

#### other
```sh
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

```sh
ln -s ~/git/dotfiles/vscode.json ~/Library/Application\ Support/Code/User/settings.json
```

```
:PlugInstall
```
