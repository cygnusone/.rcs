export EDITOR=/usr/bin/vim;
alias gitlog="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"
function git-branch-name {
    git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3,4
}
function git-branch-prompt {
    local branch=`git-branch-name`
        if [ $branch ]; then printf " [%s]" $branch; fi
}
function __host {
    echo $HOSTNAME | awk -F'[.]' '{print $2}'
}
PS1="\n$(tput setaf 1)\](-\[$(tput setaf 7)\]o\[$(tput setaf 1)\]-)\[$(tput setaf 1)\]\[$(tput sgr0)\]\[$(tput setaf 2)\] [ \w ] \$(tput setaf 1)\](-\[$(tput setaf 7)\]o\[$(tput setaf 1)\]-)\[$(tput setaf 1)\]\[$(tput sgr0)\]\[$(tput setaf 2)\]$(tput sgr0)\]\n\u@\$(__host)\[\033[0;36m\]\[\033[0m\]\[\033[0;32m\]:\$(git-branch-prompt)\[\033[0m\] $ "
PS2="\[$(tput setaf 0)\]\u@\$(__host):\w\$(git-branch-prompt)\[$(tput sgr0)\] "
alias ll='ls -Glah';
alias bashrc='vim ~/.bashrc';
alias vimrc='vim ~/.vimrc';
alias inputrc='vim ~/.inputrc';
alias tag_beta='/var/hp/dev/bin/tag_beta';
alias rcs_git='git clone https://github.com/gabrielpeery/.rcs.git';
alias vundle='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
