# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:		June 19, 2012
# Last modified on:	June 20, 2012
#functions

preexec() {
}
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Two line prompt with "status bar" below main prompt
#PROMPT=$'$fg[white]\n\n $(git_prompt_info)$my_gray%n@%M %{$reset_color%}%FG[237] %d\e[100D\e[A $fg[white]$: '

# primary prompt
PROMPT=$'%n@%-3M$fg[green][%~/]%{$reset_color%} $(git_prompt_info)'
PROMPT+=$'\n$: '


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
