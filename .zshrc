bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zoshima"
ZSH_DISABLE_COMPFIX="true"

if [ `uname` = 'Darwin' ]; then
  plugins=(
    git
  )

  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  plugins=(
    git
    zsh-autosuggestions
  )
fi

source $ZSH/oh-my-zsh.sh

bindkey '^K' autosuggest-accept

# go
export PATH="$PATH":"$HOME/go/bin"

# custom
export PATH="$PATH":"$HOME/.local/bin"

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
