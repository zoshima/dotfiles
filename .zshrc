export ZSH="/Users/kdi/.oh-my-zsh"

ZSH_THEME="veles"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
