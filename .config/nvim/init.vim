set mouse=a
set number

" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

set wrap
set linebreak

set clipboard+=unnamedplus

set splitbelow
let g:netrw_banner = 0
let g:netrw_altv = 1

" Bindings
nnoremap <Up> gk
inoremap <Up> <C-o>gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj
