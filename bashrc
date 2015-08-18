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
function __dorc {
    DIR="$HOME/.rcs"
    HOST=`echo $HOSTNAME | awk -F'[.]' '{print $2}'`
    #if [ $HOST != 'employee-macbook' ]; then
        if [ ! -d "$DIR" ]; then
            echo "It doesn't look like you have ~/.rcs/ cloning git repo";
            git clone https://github.com/cygnusone/.rcs.git;
        fi

        RCDIFF=`diff $HOME/.vimrc $DIR/vimrc`;
        if [ ! -z "$RCDIFF" ]; then
            echo "would have got a new .rcs";
            #rm -rf $DIR;
            #git clone https://github.com/cygnusone/.rcs.git;
        fi
        if [ $HOST != 'employee-macbook' ]; then
            cd /var/hp/;
        else
            cd $HOME;
        fi
    #fi
}
PS1="\[\033[01;32m\]\u\$(__host)-\[\033[0;36m\]\w\[\033[0m\]\[\033[0;32m\]\$(git-branch-prompt)\[\033[0m\] \$ "
alias ll='ls -Glah';
alias bashrc='vim ~/.bashrc';
alias vimrc='vim ~/.vimrc';
alias inputrc='vim ~/.inputrc';
