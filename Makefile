update:
	git submodule update --remote --recursive

links:
	rm ~/.gitconfig || true
	rm ~/.bashrc || true
	rm ~/.toprc || true
	ln -s ~/git/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/git/dotfiles/.bashrc ~/.bashrc
	ln -s ~/git/dotfiles/.toprc ~/.toprc

vim:
	rm ~/.vimrc || true
	ln -s ~/git/dotfiles/.vimrc ~/.vimrc

nvim:
	./scripts/setup_nvim.sh

services:
	./scripts/setup_services.sh

.PHONY: update links vim nvim services
