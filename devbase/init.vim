call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go'
call plug#end()

" Duoplete
let g:deoplete#enable_at_startup = 1

" Syntax
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid_material
syntax enable

" vim-go
let g:go_auto_sameids = 1

se mouse=""
se nu
se ts=2
se sw=2

" Workaround for konsole
set guicursor=

let g:go_fmt_command = "goimports"

au FileType gitcommit set tw=72
filetype plugin indent on
