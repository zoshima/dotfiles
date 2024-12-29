update:
	git submodule update --remote --recursive

links: bash git top

bash:
	rm ~/.bashrc || true
	ln -s ~/git/dotfiles/.bashrc ~/.bashrc

git:
	rm ${XDG_CONFIG_HOME}/git/config || true
	mkdir -p ${XDG_CONFIG_HOME}/git/
	ln -s ~/git/dotfiles/.gitconfig ${XDG_CONFIG_HOME}/git/config

ghostty:
	rm ${XDG_CONFIG_HOME}/ghostty/config || true
	mkdir -p ${XDG_CONFIG_HOME}/ghostty/
	ln -s ~/git/dotfiles/.ghostty ${XDG_CONFIG_HOME}/ghostty/config

top:
	rm ${XDG_CONFIG_HOME}/procps/toprc || true
	mkdir -p ${XDG_CONFIG_HOME}/procps/
	ln -s ~/git/dotfiles/.toprc ${XDG_CONFIG_HOME}/procps/toprc

vim:
	rm ~/.vimrc || true
	ln -s ~/git/dotfiles/.vimrc ~/.vimrc

nvim:
	./scripts/setup_nvim.sh

services:
	./scripts/setup_services.sh

.PHONY: update links vim nvim services git
