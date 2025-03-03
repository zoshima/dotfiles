bash:
	rm ~/.bashrc || true
	ln -s ~/git/dotfiles/.bashrc ~/.bashrc

ghostty:
	ln -s ~/git/dotfiles/.ghostty ~/.ghostty

nvim:
	./scripts/setup_nvim.sh

services:
	./scripts/setup_services.sh

.PHONY: bash nvim services
