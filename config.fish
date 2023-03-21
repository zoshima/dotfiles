set -x PATH $PATH c

# profile
set -x PATH "$PATH":"$HOME/bin"

# python
set -x PATH "$PATH":"$HOME/.local/bin"

# go
set -x GOPATH "$HOME/go"
set -x PATH "$PATH":"$HOME/go/bin"
set -x PATH "$PATH:/usr/local/go/bin"

# rust
set -x PATH "$PATH":"$HOME/.cargo/bin"

set -x VISUAL vim
set -x EDITOR "$VISUAL"

function ll
    ls -lh $argv
end

function zos_prompt 
	# user	
  printf "%s%s@%s%s%s:" (set_color green) $USER (prompt_hostname) (set_color normal)

	# dir
  printf "%s%s%s" (set_color cyan) (prompt_pwd) (set_color normal)

	# jobs
  set -l num_jobs (jobs | wc -l | xargs)
  if test $num_jobs -ne 0
    printf "%s[%s]%s" (set_color yellow) $num_jobs (set_color normal)
	end

	# git
	printf "%s" (fish_git_prompt)
end

function fish_prompt
  printf "%s\n%s\$%s " (zos_prompt) (set_color yellow) (set_color normal)
end

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_shorten_branch_len 30

fish_vi_key_bindings
