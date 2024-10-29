update:
	git submodule update --remote --recursive

links:
	rm ~/.gitconfig || true
	rm ~/.bashrc || true
	rm ~/.toprc || true
	ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/git/dotfiles/.bashrc ~/.bashrc
	ln -s ~/git/dotfiles/.toprc ~/.toprc

alacritty:
	rm ~/.alacritty.toml || true
	ln -s ~/git/dotfiles/.alacritty.toml ~/.alacritty.toml

tmux:
	rm ~/.tmux.conf || true
	ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf

sway:
	rm -rf ~/.config/sway/ || true
	ln -s ~/git/dotfiles/sway ~/.config/

vim:
	rm ~/.vimrc || true
	ln -s ~/git/dotfiles/.vimrc ~/.vimrc

nvim:
	./scripts/setup_nvim.sh

services:
	./scripts/setup_services.sh

.PHONY: update links alacritty tmux sway vim nvim services
