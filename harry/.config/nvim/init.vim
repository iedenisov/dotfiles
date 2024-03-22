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

" Vimwiki
let g:vimwiki_list = [{'path': '~/personalwiki/', 'name': 'Personal Wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_toc_header_level = 2
let g:vimwiki_toc_link_format = 1
