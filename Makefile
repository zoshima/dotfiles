.PHONY: bash nvim ghostty

bash:
	ln -sf ~/git/dotfiles/.bashrc ~/.bashrc

ghostty:
	mkdir -p ~/.config/ghostty
	ln -sf ~/git/dotfiles/ghostty ~/.config/ghostty/config

nvim:
	rm -rf ~/.config/nvim
	mkdir -p ~/.config/nvim/pack/git
	git clone https://github.com/nvim-treesitter/nvim-treesitter.git ~/.config/nvim/pack/git/start/nvim-treesitter
	ln -s ~/git/dotfiles/init.lua ~/.config/nvim/init.lua
