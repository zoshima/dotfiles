set_prompt() {
  F_RESET='\[$(tput sgr0)\]'
  F_BOLD='\[$(tput bold)\]'
  F_RED='\[$(tput setaf 1)\]'
  F_GREEN='\[$(tput setaf 2)\]'
  F_YELLOW='\[$(tput setaf 3)\]'
  F_BLUE='\[$(tput setaf 4)\]'

  jobs_status() {
    num_jobs=$(jobs | wc -l)

    if [ $num_jobs -gt 0 ]; then
        echo -n "[$(tput setaf 3)$num_jobs$(tput sgr0)]"
    fi
  }

  git_status() {
    branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ ! -z $branch_name  ]; then
      echo -n "($branch_name"

      if [ $(git status --porcelain | wc -l) -gt 0 ]; then
        echo -n "$(tput setaf 1)*$(tput sgr0)"
      fi

      echo -n ")"
    fi
  }

	user="$F_GREEN\u$F_RESET"
	host="\h"
	directory="$F_RESET$F_BOLD$F_BLUE\w$F_RESET"
	prompt="$F_BOLD$F_YELLOW\$$F_RESET"

  export PS1="$user@$host:$directory\$(jobs_status)\$(git_status)\n$prompt "
	export PS2="$F_BOLD$F_YELLOW> $F_RESET"
}

export HISTSIZE=-1
export HISTFILESIZE=-1

export EDITOR=vim
export PATH="$PATH:~/.local/bin"

export WINIT_UNIX_BACKEND=x11

alias ls="ls --color=auto"
alias ll="ls -al"

alias manpac="vim ~/git/dotfiles/notes/pacman.txt"

set_prompt
