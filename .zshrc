export ZSH="/Users/kdi/.oh-my-zsh"

export PATH="$PATH:/Users/kdi/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

ZSH_THEME="veles"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
