function parse_git_dirty {
  [[ -z $(git status --porcelain) ]] || echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\u@\h:\W\[\033[32m\](\$(parse_git_branch))\[\033[00m\]$ "
