"----- Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"----- Get Plug plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-sandwich' "Surrounding for quoting and parenthesizing
Plug 'mattn/emmet-vim' " emmet is HTML expansion
Plug 'junegunn/fzf.vim' " fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive' " github
Plug 'ap/vim-css-color'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'eslint/eslint'
call plug#end()

"----- Unmap the arrow keys in normal and visual mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"---- Set the view of indentation and indentation to 2.
filetype indent on
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab

"----- Interface options
set noshowmode
set relativenumber
set nu
set laststatus=2 "always show the statusbar (the one on the bottom)
set confirm "display confirmation when closing unsaved file

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
 
"----- Set the color theme
colo gruvbox 
set background=dark

"----- Set aliases to improve efficiency
command W w
command Wq wq
command WQ wq

"----- Set shortcuts in LaTeX documents 
autocmd filetype tex set tw=80
set spell
set spelllang=da

autocmd filetype text set tw=80

"----- set the placement of the swap files
set backupdir=~/.backup/,/tmp//
set directory=~/.swp/,/tmp//
set undodir=~/.undo/,/tmp//

"----- set vimtex options
let g:vimtex_fold_enabled = 1
let g:vim_fold_types = {'sections' : {'parse_levels' : 3}}
let g:tex_flavor = 'latex'

set updatetime=300


"----- fzf search in file
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

runtime cocsettings.vim
