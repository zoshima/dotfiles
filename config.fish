set -x PATH $PATH c

set -x GOPATH "$HOME/go"
set -x PATH "$PATH":"$HOME/go/bin"
set -x PATH "$PATH:/usr/local/go/bin"

set -x VISUAL vim
set -x EDITOR "$VISUAL"

function ll
    ls -lh $argv
end

function zos_prompt_jobs
  set -l num_jobs (jobs | wc -l | xargs)

  if test $num_jobs -ne 0
    printf "%s[%s]%s" (set_color yellow) $num_jobs (set_color normal)
  end
end

function zos_prompt_user
  printf "%s%s@%s%s%s" (set_color green) $USER $hostname (set_color normal)
end

function zos_prompt_pwd
  printf "%s%s%s" (set_color blue) (prompt_pwd) (set_color normal)
end

function fish_prompt
  printf '%s:%s%s%s$ ' (zos_prompt_user) (zos_prompt_pwd) (zos_prompt_jobs) (fish_git_prompt)
end

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showcolorhints 'yes'

fish_vi_key_bindings
