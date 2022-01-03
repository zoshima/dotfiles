bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zoshima"
ZSH_DISABLE_COMPFIX="true"

plugins=(
  git
  zsh-autosuggestions
)

if [ `uname` = 'Darwin' ]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

source $ZSH/oh-my-zsh.sh

bindkey '^K' autosuggest-accept

# dotnet core
export PATH="$PATH:$HOME/.dotnet/tools"

DOTNET_CLI_TELEMETRY_OPTOUT=1
FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

# go
export PATH="$PATH":"$HOME/go/bin"

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home"

# custom
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.local/bin"

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
