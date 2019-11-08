runtime! debian.vim

"----- Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"----- Get Plug plugins
call plug#begin()
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
call plug#end()

"----- NERDTtree
"Start on startup
"If NERDTree is the only of two windows, close vim
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"----- Unmap the arrow keys in normal and visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"----- Set the ALT key bindings to work in tex
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

"---- Set the latex flavor
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
set grepprg=grep\ -nH\ $*

"---- Set the view of indendation and indentation to 2.
filetype indent on
set tabstop=2
set laststatus=2
set shiftwidth=2

"----- Set the numbering to relative and, show the actual line of the current
"line
set noshowmode
set relativenumber
set nu

"----- Set the color theme
colo seoul256
set background=dark
let g:seoul256_srgb = 1
