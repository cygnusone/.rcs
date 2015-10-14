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

host_parse(){
    if [[ $HOST =~ 'alpha' ]] 
        then 
            echo $(echo $HOST | awk -F'.' '{print $2 "." $1}')
        else 
            echo "home"
    fi
}

# Two line prompt with "status bar" below main prompt
#PROMPT=$'$fg[white]\n\n $(git_prompt_info)$my_gray%n@%M %{$reset_color%}%FG[237] %d\e[100D\e[A $fg[white]$: '

# primary prompt
PROMPT=$'$fg[green][%~/]%{$reset_color%}'
PROMPT+=$'\n%n@'
PROMPT+='$(host_parse): '
RPROMPT='$(git_prompt_info) '

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$fg[red]%}!!"
ZSH_THEME_GIT_PROMPT_UNTRACKED=")%{$fg[green]%}??"
ZSH_THEME_GIT_PROMPT_CLEAN=")"
