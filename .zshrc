bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# oh my zsh
export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="zoshima"
ZSH_DISABLE_COMPFIX="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^K' autosuggest-accept

# dotnet core
export PATH="$PATH:/Users/$USER/.dotnet/tools"

DOTNET_CLI_TELEMETRY_OPTOUT=1
FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home"

# custom
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/.local/bin"
