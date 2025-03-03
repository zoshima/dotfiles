set_prompt() {
  F_RESET='\[$(tput sgr0)\]'
  F_BOLD='\[$(tput bold)\]'
  F_RED='\[$(tput setaf 1)\]'
  F_GREEN='\[$(tput setaf 2)\]'
  F_YELLOW='\[$(tput setaf 3)\]'
  F_BLUE='\[$(tput setaf 4)\]'
  F_PURPLE='\[$(tput setaf 5)\]'
  F_CYAN='\[$(tput setaf 6)\]'

  jobs_status() {
    num_jobs=$(jobs | wc -l)

    if [ $num_jobs -gt 0 ]; then
      echo -n "[$(tput setaf 3)$num_jobs$(tput sgr0)]"
    fi
  }

  git_status() {
    branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ ! -z $branch_name ]; then
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

ffind() {
  find . -iname "*$1*" 2>/dev/null
}

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export ANSIBLE_HOME="${XDG_DATA_HOME}/ansible"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GOPATH="${XDG_DATA_HOME}/go"
export NPM_CONFIG_INIT_MODULE="${XDG_CONFIG_HOME}/npm/config/npm-init.js"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NPM_CONFIG_TMP="${XDG_RUNTIME_DIR}/npm"
export PSQL_HISTORY="${XDG_STATE_HOME}/psql_history"
export SQLITE_HISTORY="${XDG_CACHE_HOME}/sqlite_history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth
export HISTFILE="${XDG_STATE_HOME}/bash/history"
if [ ! -f ${HISTFILE} ]; then
  touch ${HISTFILE}
fi

export EDITOR=nvim

export MANPAGER='nvim +Man!'
export MANWIDTH=999

export PATH="$PATH:/home/$USER/.local/bin"
export PATH="$PATH:/home/$USER/go/bin"

export WINIT_UNIX_BACKEND=x11

shopt -s histappend
shopt -s checkwinsize

alias ls="ls -h --time-style='+%F %T' --color=auto"
alias ll="ls -al"

set_prompt
