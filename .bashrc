set_prompt() {
	F_RESET="$(tput sgr0)"
	F_BOLD="$(tput bold)"
	F_CYAN="$(tput setaf 80)"
	F_BLUE="$(tput setaf 75)"
	F_LIGHT_BLUE="$(tput setaf 81)"
  F_YELLOW="$(tput setaf 228)"
  F_GREEN="$(tput setaf 114)"
  F_ORANGE="$(tput setaf 215)"

	user="$F_BOLD$F_LIGHT_BLUE\u$F_RESET"
	host="\h"
	directory="$F_RESET$F_BOLD$F_BLUE\w$F_RESET"
	num_jobs="$F_ORANGE\$([ \j -gt 0 ] && echo [\j])$F_RESET"
	git_branch="\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"
	prompt="$F_BOLD$F_YELLOW\$$F_RESET"

	export PS1="$user@$host:$directory$num_jobs$git_branch\n$prompt "
	export PS2="$F_BOLD$F_YELLOW> $F_RESET"
}

export EDITOR=vim

alias ls="ls --color=auto"
alias ll="ls -al"

alias manpac="vim ~/git/dotfiles/notes/pacman.txt"
alias vim="nvim"

set_prompt

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:~/.local/bin:~/go/bin"
