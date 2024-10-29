set mouse=a
set number
set relativenumber

" spellcheck
set spell
set spelllang=en,ru,de

" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

set wrap
set linebreak

set clipboard+=unnamedplus

set splitbelow
let g:netrw_banner = 0
let g:netrw_altv = 1
" let g:splitright = 1
" let g:splibelow = 1

" Bindings
nnoremap <Up> gk
inoremap <Up> <C-o>gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj

"" Built-in terminal emulator
" Exit terminal mode with <Esc>
:tnoremap <\><Esc> <C-\><C-n>
