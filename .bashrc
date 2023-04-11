export PS1="\[$(tput bold)\]\[\033[38;5;6m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;2m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

alias ls="ls --color=auto"
alias ll="ls -al"

export PATH="$PATH:/home/kdi/.local/bin"
