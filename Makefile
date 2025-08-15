.PHONY: bash nvim ghostty

bash:
	ln -sf ~/git/dotfiles/bashrc ~/.bashrc

ghostty:
	mkdir -p ~/.config/ghostty
	ln -sf ~/git/dotfiles/ghostty ~/.config/ghostty/config

nvim:
	rm -rf ~/.config/nvim
	mkdir ~/.config/nvim
	ln -s ~/git/dotfiles/nvim/* ~/.config/nvim
	git clone -b main \
		https://github.com/nvim-treesitter/nvim-treesitter.git \
		~/.config/nvim/pack/git/start/nvim-treesitter
