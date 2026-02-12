if type brew &>/dev/null; then
  eval $(brew shellenv)
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz colors && colors
autoload -Uz compinit && compinit

bindkey -v

setopt prompt_subst
setopt share_history
setopt hist_ignore_all_dups

git_status() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -z "$branch" ]]; then
    return
  fi
  
  local dirty=""
  if [[ $(git status --porcelain 2>/dev/null | wc -l) -gt 0 ]]; then
    dirty="%F{red}*%f"
  fi
  
  echo -n "($branch$dirty)"
}

jobs_status() {
  local num=${#jobstates}
  if [[ "$num" -gt 0 ]]; then
    echo -n "[%F{yellow}$num%f]"
  fi
}

ffind() { 
  find . -iname "*$1*" 2>/dev/null 
}

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export HISTSIZE=2000
export SAVEHIST=$HISTSIZE

export PATH="$PATH:/opt/homebrew/opt/postgresql@18/bin/"
export PATH="$PATH:/Users/$(whoami)/go/bin/"

alias ls="ls -hG"
alias ll="ls -alG"

PROMPT='%F{green}%n%f@%m:%F{blue}%~%f$(jobs_status)$(git_status)
%F{yellow}$%f '

PS2="%F{yellow}> %f"
