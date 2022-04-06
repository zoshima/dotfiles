# color vars
eval col_main='$FG[006]'
eval col_backdrop='$FG[008]'
eval col_branch='$FG[003]'
eval col_jobs='$FG[001]'
eval col_dirty='$FG[001]'
eval col_foreground='$FG[007]'

# left prompt
PROMPT='$col_main%~%(1j. $col_jobs(%j)%{$reset_color%}.) $(git_prompt_info)$col_main%(!.#.:) %{$reset_color%}'

# right prompt
RPROMPT='$col_backdrop%*%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$col_branch<"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$col_dirty*"
ZSH_THEME_GIT_PROMPT_SUFFIX="$col_branch>%{$reset_color%}"
