# nvim + ts
## homebrew
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### formulae
```
git
zsh
zsh-autosuggestions
zsh-completions
fzf
prettier
yarn
python
neovim
```

## links
```sh
ln -s ~/git/dotfiles/init.vim ~/.config/nvim/init.vim 
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/git/dotfiles/veles.zsh-theme ~/.oh-my-zsh/themes/veles.zsh-theme
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
```

## neovim
```sh
brew install neovim
pip3 install neovim
yarn global add neovim
```

### vim-plug
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
:PlugInstall
:UpdateRemotePlugins
```
