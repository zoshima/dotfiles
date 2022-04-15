set -x PATH $PATH c

set -x GOPATH "$HOME/go"
set -x PATH "$PATH":"$HOME/go/bin"
set -x PATH "$PATH:/usr/local/go/bin"

set -x VISUAL vim
set -x EDITOR "$VISUAL"

function ll
    ls -lh $argv
end