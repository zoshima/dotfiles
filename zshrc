bindkey -v

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -U colors && colors
autoload -U compinit && compinit

setopt prompt_subst
setopt share_history

git_status() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -z "$branch" ]] && return
  
  local dirty=""
  [[ $(git status --porcelain 2>/dev/null | wc -l) -gt 0 ]] && dirty="%F{red}*%f"
  
  echo -n "($branch$dirty)"
}

jobs_status() {
  local num=${#jobstates}
  [[ "$num" -gt 0 ]] && echo -n "[%F{yellow}$num%f]"
}

ffind() { find . -iname "*$1*" 2>/dev/null }

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export HISTSIZE=1000000
export SAVEHIST=1000000

export PATH="$PATH:/opt/homebrew/opt/postgresql@18/bin/"
export PATH="$PATH:/Users/kdi/go/bin/"

alias ls="ls -hG"
alias ll="ls -alG"

PROMPT='%F{green}%n%f@%m:%F{blue}%~%f$(jobs_status)$(git_status)
%F{yellow}$%f '

PS2="%F{yellow}> %f"
