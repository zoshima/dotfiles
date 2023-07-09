
set_prompt() {
	F_RESET="$(tput sgr0)"
	F_BOLD="$(tput bold)"
	F_CYAN="$(tput setaf 80)"
	F_BLUE="$(tput setaf 75)"
	F_LIGHT_BLUE="$(tput setaf 81)"
  F_YELLOW="$(tput setaf 228)"
  F_GREEN="$(tput setaf 114)"
  F_ORANGE="$(tput setaf 215)"

  git_status() {
    if [ $(git branch 2>/dev/null | wc -l) -gt 0 ]; then
      git_branch="$(git rev-parse --abbrev-ref HEAD)"

      if [ $(git status --porcelain | wc -l) -gt 0 ]; then
        git_branch="$git_branch$F_ORANGE*$F_RESET"
      fi

      echo "($git_branch)"
    fi
  }

	user="$F_BOLD$F_LIGHT_BLUE\u$F_RESET"
	host="\h"
	directory="$F_RESET$F_BOLD$F_BLUE\w$F_RESET"
	num_jobs="$F_ORANGE\$([ \j -gt 0 ] && echo [\j])$F_RESET"
	prompt="$F_BOLD$F_YELLOW\$$F_RESET"

  export PS1="$user@$host:$directory$num_jobs\$(git_status)\n$prompt "
	export PS2="$F_BOLD$F_YELLOW> $F_RESET"
}

export HISTSIZE=-1
export HISTFILESIZE=-1

export EDITOR=vim
export PATH="$PATH:~/.local/bin"

alias ls="ls --color=auto"
alias ll="ls -al"

alias manpac="vim ~/git/dotfiles/notes/pacman.txt"
alias vim="nvim"

set_prompt
