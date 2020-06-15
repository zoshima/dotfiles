export ZSH="/Users/kdi/.oh-my-zsh"

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/bin"

ZSH_THEME="zoshima"
DOTNET_CLI_TELEMETRY_OPTOUT=1

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/bin/aliases.sh

bindkey '^K' autosuggest-accept
