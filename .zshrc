export ZSH="/Users/$USER/.oh-my-zsh"

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/bin"

# .NET Core SDK tools
export PATH="$PATH:/Users/$USER/.dotnet/tools"

# Java
export PATH="$PATH:/usr/local/opt/openjdk@8/bin"
export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"

# Android
export PATH="$PATH":"/Users/$USER/android-sdk/cmdline-tools/latest/bin"
export ANDROID_SDK_ROOT="/Users/$USER/android-sdk"

ZSH_THEME="zoshima"
ZSH_DISABLE_COMPFIX="true"

DOTNET_CLI_TELEMETRY_OPTOUT=1
FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/bin/aliases.sh

bindkey '^K' autosuggest-accept

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u
