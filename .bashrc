set_prompt() {
	F_RESET="\[$(tput sgr0)\]"
	F_BOLD="\[$(tput bold)\]"
	F_CYAN="\[\033[38;5;6m\]"
	F_BLUE="\[\033[38;5;4m\]"
	F_YELLOW="\[\033[38;5;3m\]"
	F_GREEN="\[\033[38;5;2m\]"

	user="$F_BOLD$F_CYAN\u$F_RESET"
	host="\h"
	directory="$F_RESET$F_BOLD$F_BLUE\w$F_RESET"
	num_jobs="$F_YELLOW\$([ \j -gt 0 ] && echo [\j])$F_RESET"
	git_branch="\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"
	prompt="$F_BOLD$F_GREEN\$$F_RESET"

	export PS1="$user@$host:$directory$num_jobs$git_branch\n$prompt "
}

alias ls="ls --color=auto"
alias ll="ls -al"

set_prompt
