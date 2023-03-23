## links

```sh
ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
```

## nvim

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```packages
neovim
ripgrep
```

```sh
ln -s ~/git/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/git/dotfiles/nvim/lua ~/.config/nvim/lua
```
