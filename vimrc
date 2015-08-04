" Hello Vim, goodbye Vi
set nocompatible
syntax off
filetype off
call pathogen#infect()
syntax on

" General Settings
set anti
set autoread
set backspace=indent,eol,start
set hidden
set history=1000
set linebreak
set nostartofline
set nowrap
set shortmess+=filmnrxoOtT
set showcmd
set showmatch
set showmode
set ttyfast
set viewoptions=cursor,folds,slash,unix
set visualbell
set virtualedit=onemore

" GVim
if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h18:cANSI
    else
        set guifont=Inconsolata:h18
    endif
endif


" Bundles (Vundle)
"set rtp+=~/.vim/plugin/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'mru.vim'
Bundle 'CSSMinister'
Bundle 'watchdog.vim'
Bundle 'sjl/gundo.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'inkarkat/vcscommand.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/html5-syntax.vim'
Bundle 'miripiruni/CSScomb-for-Vim'

call vundle#end()            " required
filetype plugin indent on    " required

" General Mappings
let mapleader = ','
nnoremap ; :
nnoremap q :
vnoremap < <gv
vnoremap > >gv
cmap w!! w !sudo tee % >/dev/null
command! -nargs=? Vdiff :VCSVimDiff <args>
map <C-O> <Esc>o
map! <C-O> <Esc>o
nmap <C-I> :call zencoding#imageSize()<CR>
map :cc :VCSCommit<CR>
map :ws :%s/\s\+$//<CR>
map :img /\v\<img.*>&(.*width)@!<CR>
nnoremap <C-P> :nohls<CR>
inoremap <C-P> <C-O>:nohls<CR>
nmap a I
nmap ,d :Vdiff HEAD<CR>
nmap ,,d :Vdiff
nmap ,g :%s/^$\n//cgi<CR>
nmap ,l :VCSLog<CR>
nmap ,m :SessionSave<CR>
nmap ,o :MRU<CR>
nmap ,p :SessionList<CR>
nmap ,q :!sudo service httpd graceful<CR>
nmap ,s :source ~/.vimrc<CR>
nmap ,t :s#<[^>]\+>##g<CR>:nohls<CR>
nmap ,u :GundoToggle<CR>
nmap ,v :tabe ~/.vimrc<CR>
set pastetoggle=<C-H>
:ca WQ wq
:ca Wq wq
:ca W w
:ca Q q
:ca m MRU
:ca length call LengthSort()
:ca Length length
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" Zencoding Mappings
let g:user_zen_leader_key = '<C-J>'
let g:user_zen_next_key = '<C-L>'
let g:user_zen_prev_key = '<C-K>'

" Tab Management
set tabpagemax=15
nmap tq <Esc>:q<CR>
nmap tp <Esc>:tabp<CR>
nmap tn <Esc>:tabn<CR>
nmap tm <Esc>:tabm
nmap te <Esc>:tabe /var/www/|
map <D-PageUp> <Esc>:tabp<CR>
map <D-PageDown> <Esc>:tabn<CR>

" Backups
set nobackup
set noswapfile
function! MakeBackup()
    let pos    = line(".")
    let b:dir  = $HOME . "/.vim/backup/" . strftime("%m.%d.%Y") . "/"
    let b:file = b:dir . substitute(expand("%:t"), "^\\.", "", "") . strftime(".%H.%M.%S")
    silent! exe mkdir(b:dir, "p")
    exe writefile(getline(1,'$'), b:file)
    exe pos
endfunction

" Undo
if version >= 703
    set undodir=$HOME/.vim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Searching
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch
set hlsearch
set ignorecase
set smartcase

" Folding
set nofoldenable
set foldmethod=manual
set foldminlines=2

" Wild Menu
set wildmenu
set wildmode=longest,list,full
set wildignore=*.swp,*.bak,*.pyc,*.class

" Auto-scroll
set scrolloff=5
set sidescrolloff=7
set sidescroll=1

" Filetype Plugins
filetype plugin indent on

    "Javascript
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"

au! BufNewFile,BufRead *.tt setf html
au! BufNewFile,BufRead *.css set indentkeys=<F13>|set noautoindent|set nosmartindent|set nocindent|set indentexpr=
au! BufWritePre * silent :call MakeBackup()
au! BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI * checktime

" Make/Load View
au! BufWinLeave * silent mkview
au! BufRead * silent loadview

" Status Bar
set noruler
set laststatus=2
"set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Indents
set autoindent
set smartindent
set shiftround

" Mouse
set mouse=nicr

" Tabs
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set showtabline=2
if !has('gui')
    set term=$TERM
endif

set paste
