call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'
Plug 'mru.vim'
Plug 'CSSMinister'
Plug 'sjl/gundo.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'inkarkat/vcscommand.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5-syntax.vim'
Plug 'miripiruni/CSScomb-for-Vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'csscomb/vim-csscomb'
Plug 'Lokaltog/vim-powerline'

" Expandregion
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Gundo: Undo tree visualizer
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
nnoremap <leader>u :GundoToggle<CR>
"

Plug 'scrooloose/nerdtree'
Plug 'aperezdc/vim-template'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'

" Unity stuffs maybe?

call plug#end()
