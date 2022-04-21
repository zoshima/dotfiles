set -x PATH $PATH c

set -x GOPATH "$HOME/go"
set -x PATH "$PATH":"$HOME/go/bin"
set -x PATH "$PATH:/usr/local/go/bin"

set -x VISUAL vim
set -x EDITOR "$VISUAL"

function ll
    ls -lh $argv
end

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showcolorhints 'yes'

fish_vi_key_bindings
