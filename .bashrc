export COL_BG="#1C1C1C"

export COL_WHITE="#ffffff"
export COL_GRAY="#616161"

export COL_RED="#e57373"
export COL_GREEN="#aed581"
export COL_BLUE="#4fc3f7"

export COL_PINK="#f06292"
export COL_YELLOW="#fff176"
export COL_ORANGE="#ffb74d"

fromhex() {
  hex=$1

  if [[ $hex == "#"* ]]; then
    hex=$(echo $1 | awk '{print substr($0,2)}')
  fi

  r=$(printf '0x%0.2s' "$hex")
  g=$(printf '0x%0.2s' ${hex#??})
  b=$(printf '0x%0.2s' ${hex#????})

  echo -e `printf "%d" "$(((r<75?0:(r-35)/40)*6*6+(g<75?0:(g-35)/40)*6+(b<75?0:(b-35)/40)+16))"`
}


set_prompt() {
	F_RESET="$(tput sgr0)"
	F_BOLD="$(tput bold)"
  F_BLUE="$(tput setaf $(fromhex $COL_BLUE))"
  F_YELLOW="$(tput setaf $(fromhex $COL_YELLOW))"
  F_GREEN="$(tput setaf $(fromhex $COL_GREEN))"
  F_ORANGE="$(tput setaf $(fromhex $COL_ORANGE))"
  F_RED="$(tput setaf $(fromhex $COL_RED))"

  git_status() {
    if [ $(git branch 2>/dev/null | wc -l) -gt 0 ]; then
      git_branch="$(git rev-parse --abbrev-ref HEAD)"

      if [ $(git status --porcelain | wc -l) -gt 0 ]; then
        git_branch="$git_branch$F_RED*$F_RESET"
      fi

      echo "($git_branch)"
    fi
  }

	user="$F_GREEN\u$F_RESET"
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
