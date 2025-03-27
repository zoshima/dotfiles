.PHONY: bash nvim

bash:
	rm ~/.bashrc || true
	ln -s ~/git/dotfiles/.bashrc ~/.bashrc

nvim:
	rm -rf ~/.config/nvim || true && mkdir -p ~/.config/nvim/pack/git
	git clone https://github.com/nvim-treesitter/nvim-treesitter.git ~/.config/nvim/pack/git/start/nvim-treesitter
	ln -s ~/git/dotfiles/nvim.lua ~/.config/nvim/init.lua
