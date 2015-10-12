# Important
export CLICOLOR=1
export EDITOR=/usr/bin/vim;
ZSH=$HOME/.omz
ZSH_CUSTOM=$HOME/.zsh
ZSH_THEME='af-magic'
DISABLE_AUTO_TITLE='true'
plugins=(vundle yum git) #removed git
source $ZSH/oh-my-zsh.sh
source $HOME/.private;
fpath=($HOME/.zsh $fpath)
autoload -Uz functions.zsh
export GREP_COLOR='31'
export GREP_OPTIONS='--color=auto --exclude-dir=CVS'
export PATH=$HOME/bin:/usr/local/bin:$PATH
SAVEHIST=100000
HISTSIZE=100000
umask 002


#Autoloads
autoload -U edit-command-line
autoload -U url-quote-magic
autoload -Uz compdef
autoload colors; colors;
autoload read_write
#Last
autoload -Uz compinit; compinit;

# ZSH Options
setopt always_to_end
setopt appendhistory
setopt autocd
setopt auto_continue
setopt auto_menu
setopt auto_remove_slash
setopt bash_auto_list
setopt cdable_vars
#setopt complete_in_word
setopt correct
#setopt correct_all
setopt extended_glob
setopt extended_history
setopt flowcontrol
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt ignore_eof
setopt inc_append_history
setopt list_ambiguous
setopt long_list_jobs
#setopt no_menu_complete
setopt multios
setopt nohup
setopt notify
setopt no_bg_nice
setopt no_case_glob
setopt no_hup
setopt no_list_beep
setopt numeric_glob_sort
setopt prompt_subst
setopt share_history
setopt zle

# ZSH Styles
zle -N edit-command-line
zle -N self-insert url-quote-magic
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:(diff|kill|rm|vi|vim):*' ignore-line yes
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:match:*' original only
zstyle ':completion:history-words:*' list no
zstyle ':completion:history-words:*' menu yes
zstyle ':completion:history-words:*' remove-all-dups yes
zstyle ':vcs_info:*' enable cvs
zstyle ':vcs_info:(cvs):*' get-revision true
zstyle ':vcs_info:(cvs):*' check-for-changes true
zstyle '*' single-ignored show
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs
zmodload -i zsh/complist

# Aliases
alias :Q=':q'
alias :q='exit'
alias 5='%'
alias j='jobs -l'
alias ex='extract'
alias grep='grep --color=auto'
alias g='grep -irn'
alias history='fc -l 1'
alias less='less -R'
alias l='ls'
alias ll='ls'
alias ls='ls -AFlh'
alias sl='ls'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir -p'
alias cp='cp -i'
alias mv='nocorrect mv -i'
alias rm='nocorrect rm -i'
alias sc='screen -DR `whoami`'
alias watch='watch --color'
alias urc='source ~/.zshrc'
alias tag_beta='/var/hp/dev/bin/tag_beta'
alias tag_live='/var/hp/dev/bin/tag_live'
alias rcs_git='git clone https://github.com/gabrielpeery/.rcs.git';
alias vundle='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
alias get='git'

# Services
alias sudo='nocorrect sudo'
alias alog='tail -f /var/log/httpd/access_log | grep -v connectiontest.txt'
alias elog='tail -f /var/log/httpd/error_log | grep -v connectiontest.txt'
alias ar='sudo service httpd restart'
alias ag='sudo service httpd graceful'
alias h='ag';
alias mem='sudo service memcached restart'
alias mysql='nocorrect mysql'
alias png="perl -e'for my \$png (<*.png>) { system(qq{optipng \$png});}'"
alias jpg="perl -e'for my \$jpg (<*.jpg>) { system(qq{jpegoptim --strip-all \$jpg});}'"
alias gif="perl -e'for my \$gif (<*.gif>) { system(qq{optipng \$gif});}'"

# Dot files
alias rz='rm -f $HOME/.zcompdump && exec zsh'
alias sb='source $HOME/.bashrc'
alias sz='source $HOME/.zshrc'
alias vb='vim $HOME/.bashrc'
alias vc='vim $HOME/.screenrc'
alias vd='vim -c VCSVimDiff'
alias vf='vim $HOME/.zsh/functions.zsh'
alias vi='vim'
alias vim='vim -p'
alias vp='vim $HOME/.private'
alias vs='vim -c SessionList'
alias vv='vim $HOME/.vimrc'
alias vz='vim $HOME/.zshrc'

# CVS
alias ca='cvs add'
alias ck='cvs add -kb'
alias cm='cvs commit'
alias cs='/var/www/bin/cvsstatus'
alias u='cvs -q update -Pd'

# Git
alias ga='git add'
alias gc='git commit'
alias gp='git push origin master'
alias gl='git pull origin'


bopen() {
    if [[ $1 == 'alpha' ]]; then
        if [[ $2 == 'all_brands' ]]; then
            `/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window "http://www.$3.alpha.bluehost.com/$4" "http://www.$3.alpha.hostmonster.com/$4" "http://www.$3.alpha.justhost.com/$4" "http://www.$3.alpha.fastdomain.com/$4" "http://www.$3.alpha.hostgator.sg/$4"`
        fi;
    fi;
    if [[ $1 == 'beta' ]]; then
        if [[ $2 == 'all_brands' ]]; then
            `/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window "http://www$4.betabh.com/$3" "http://www$4.betahm.com/$3" "http://www$4.betajh.com/$3" "http://www$4.betafd.com/$3" "http://www$4.beta.hostgator.sg/$3"`
        fi;
    fi;
    if [[ $1 == 'live' ]]; then
        if [[ $2 == 'all_brands' ]]; then
            `/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window "http://www.bluehost.com/$3" "http://www.hostmonster.com/$3" "http://www.justhost.com/$3" "http://www.fastdomain.com/$3" "http://www.hostgator.sg/$3"`
        fi;
    fi;
}
