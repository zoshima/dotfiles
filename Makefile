.PHONY: bash ghostty vim

bash:
	ln -sf ~/git/dotfiles/bashrc ~/.bashrc

ghostty:
	mkdir -p ~/.config/ghostty
	ln -sf ~/git/dotfiles/ghostty ~/.config/ghostty/config

vim:
	rm -rf ~/.vim
	mkdir ~/.vim
	ln -s ~/git/dotfiles/vim/* ~/.vim/
