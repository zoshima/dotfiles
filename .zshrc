bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zoshima"
# ZSH_DISABLE_COMPFIX="true"

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
source ~/.profile
