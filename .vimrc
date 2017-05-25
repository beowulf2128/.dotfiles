
" Install Pathogen
execute pathogen#infect()

" My plugins:
" - pathogen X
" - CtrlP
" - surround    cd ~/.vim/bundle && git clone https://github.com/tpope/vim-surround
" - splitjoin
" - tabular
" - airline
" To explorer:
"   Fugutive
"   ctags
"   How to comment out a line and duplicate it below not commented out?

" Enable lots of pretty colors (airline needs this)
to set t_Co=256

" Always set line numbers
set number

" Use spaces instead of tabs
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Remove trailing spaces on save
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.erb :%s/\s\+$//e
autocmd BufWritePre *.yml :%s/\s\+$//e
autocmd BufWritePre *.sql :%s/\s\+$//e
autocmd BufWritePre *.less :%s/\s\+$//e
autocmd BufWritePre *.jsx :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e

" Brighten the color of comments
hi comment cterm=NONE ctermfg=darkgreen gui=NONE guifg=green

" Darken search highlight background
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Set .erb file syntax prefs
autocmd BufNewFile,BufRead *.html.erb set syntax=html
autocmd BufNewFile,BufRead *.js.erb   set syntax=javascript

" Set status bar line always visible
set laststatus=2

" Show the commands as they are typed
set showcmd

" Show % of file scroll & total line numbers
set ruler

set cursorline    " highlight the current line
hi CursorLine term=bold cterm=bold guibg=Grey40

set splitright    " Open vertical split panes to the right
set splitbelow    " Open horizontal split panes to the bottom

" Stop Q from taking me to Ex mode, which I have no use for
nnoremap Q <nop>

" Tell vimgrep to ignore certain directories
" ... node
set wildignore+=node_modules/**,public/**
" ... rails
set wildignore+=vendor/**

" Tell CtrlP to ignore the same dirs
let g:ctrlp_custom_ignore = 'node_modules\|vendor\'
 
let g:airline_theme='simple'

