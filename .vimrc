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
Plug 'vim-latex/vim-latex'
Plug 'scrooloose/nerdtree'
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

"---- Set the view of indentation and indentation to 2.
filetype indent on
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

"----- Set search options
set hlsearch "sets highlighting when searching

"----- Interface options
set noshowmode
set relativenumber
set nu
set laststatus=2 "always show the statusbar (the one on the bottom)
set confirm "display confirmation when closing unsaved file

"----- Set the color theme
colo seoul256
set background=dark
let g:seoul256_srgb = 1

"----- Set aliases to improve efficiency
command W w
command Wq wq

"----- Set shortcuts in LaTeX documents 
autocmd filetype tex set tw=90
autocmd filetype tex set spell
augroup MyIMAPs
    au!
    autocmd FileType tex call IMAP('LIL', '\lstinline{<+code+>}<++>', 'tex')
    autocmd FileType tex call IMAP('ATTR', '\attribute{<++> : <++>}<++>', 'tex')
    autocmd FileType tex call IMAP('ASSO', '\association{<+attr1+>}{<+multiplicity1+>{<+role1+>}{<+attr2+>}{<+multiplicity2+>}{<+role+>}<++>', 'tex')
    autocmd FileType tex call IMAP('OPER', '\operation{<+operation+> (<+varname+> : <+vartype+>) : <+rettype+>}<++>', 'tex')
augroup END

"----- set the placement of the swap files
set backupdir=~/.backup/,/tmp//
set directory=~/.swp/,/tmp//
set undodir=~/.undo/,/tmp//
