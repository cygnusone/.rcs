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
    echo $HOSTNAME | awk -F'[.]' '{print "@"$2":"$3}'
}

function __getremotercs() {
    DIR="$HOME/.rcs"
    HOST=`echo $HOSTNAME | awk -F'[.]' '{print $2}'`
    echo $DIR;
    if [ ! -d "$DIR" ]; then
        echo "It doesn't look like you have ~/.rcs/ Making it and cloning git repo";
        mkdir $DIR;
        cd $DIR;
        `git clone https://github.com/cygnusone/.rcs.git`;
    else
        cd $DIR;
        DIFF=`git diff`;
        echo $DIFF;
    fi
}


PS1="\[\033[01;32m\]\u\$(__host)-\[\033[0;36m\]\w\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "
alias ll='ls -Glah';
alias bashrc='vim ~/.bashrc';
alias vimrc='vim ~/.vimrc';
alias inputrc='vim ~/.inputrc';
alias alpha='ssh alpha';
__getremotercs
