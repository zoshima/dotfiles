## links

```sh
ln -s ~/git/dotfiles/.vimrc  ~/.vimrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
```

## i3

```sh
ln -s ~/git/dotfiles/.i3status.conf  ~/.i3status.conf
ln -s ~/git/dotfiles/config ~/.config/i3/config
```

```packages
feh
xprintidle
```

### network

nmcli device wifi list
nmcli device wifi connect {id} password {pw}

### display

xrandr --output DP-0 --mode 1920x1080 --rate 144.00

### sound

pactl

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
