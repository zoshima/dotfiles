links: bash git top

bash:
	rm ~/.bashrc || true
	ln -s ~/git/dotfiles/.bashrc ~/.bashrc

git:
	rm ${XDG_CONFIG_HOME}/git/config || true
	mkdir -p ${XDG_CONFIG_HOME}/git/
	ln -s ~/git/dotfiles/.gitconfig ${XDG_CONFIG_HOME}/git/config

nvim:
	./scripts/setup_nvim.sh

services:
	./scripts/setup_services.sh

.PHONY: links bash git nvim services
