
" Install Pathogen
execute pathogen#infect()

" My plugins:
" - pathogen X
" - CtrlP
" - surround    cd ~/.vim/bundle && git clone https://github.com/tpope/vim-surround
" - splitjoin
" - tabular
" - airline
" - snipmate & snippets
" To explorer:
"   Fugutive
"   ctags

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

hi MatchParen cterm=none ctermbg=green ctermfg=blue

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

set ignorecase " Case-insensitive searching.
set smartcase  " But case-sensitive if expression contains a capital letter.

" Tell CtrlP to ignore what's in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:airline_theme='simple'

" Auto add closing characters in insert mode (when `set paste` not set)
" Use Ctrl + V to escape this behavior when typing an opening character
"ino " ""<left>
"ino ' ''<left>
"ino ( ()<left>
"ino [ []<left>
"ino { {}<left>
"ino {<CR> {<CR>}<ESC>O
"ino [<CR> [<CR>]<ESC>O
"ino {;<CR> {<CR>};<ESC>O

" Commenting blocks of code. From:
"   * https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim#1676690
"   * https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim#comment27973419_1676672
function DupAndCommentOut()
  " echo "in DupAndCOmmentOut, filetype: " . &filetype
  if has_key(g:comment_map, &filetype)
    let lineNo=line('.')
    let line=getline('.')
    call append(lineNo-1, g:comment_map[&filetype] . line)
  else
    echo "No comment leader for filetype: " . &filetype
  end
endfunction

let g:comment_map = {
    \   "javascript": '// ',
    \   "javascript.jsx": '// ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "sh": '# ',
    \   "conf": '# ',
    \   "profile": '# ',
    \   "bashrc": '# ',
    \   "bash_profile": '# ',
    \   "vim": '" ',
    \ }

" Stop Space from moving cursor forward, since it's my leader key
nnoremap <Space> <nop>

" Leader key shortcuts
let mapleader = "\<Space>"
map <leader>sNp      :set nopaste<CR>
map <leader>sp       :set paste<CR>
map <leader>sNn      :set nonumber<CR>
map <leader>sn       :set number<CR>
map <leader>do       :call DupAndCommentOut()<CR>
map <leader>cc       :<C-B>silent <C-E>s/^/<C-R>=escape(g:comment_map[&filetype],'\/')<CR>/<CR>:nohlsearch<CR>
map <leader>cu       :<C-B>silent <C-E>s/^\V<C-R>=escape(g:comment_map[&filetype],'\/')<CR>//e<CR>:nohlsearch<CR>
" paste text in default buffer above current line. https://stackoverflow.com/questions/1346737/how-to-paste-in-a-new-line-with-vim
" the space after the O is needed to retain tab indent, else ESC puts you back
" to the very beginning of the line
map <leader>P        O <ESC>P


