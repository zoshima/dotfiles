# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# wsl2+xming display
if [ -d /proc ] && [ grep -q WSL2 /proc/version ]; then
    # execute route.exe in the windows to determine its IP address
    DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0
fi

# default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# go
export GOPATH="$HOME/go"
export PATH="$PATH":"$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
