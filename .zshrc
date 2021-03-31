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
export PATH="$PATH:/usr/local/opt/openjdk@8/bin"
export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"

# android
export PATH="$PATH":"/Users/$USER/android-sdk/cmdline-tools/latest/bin"
export ANDROID_SDK_ROOT="/Users/$USER/android-sdk"

# custom
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/bin"

source ~/bin/aliases.sh
