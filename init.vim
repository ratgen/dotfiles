      
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
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh', }
Plug 'machakann/vim-sandwich'
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

"----- Set the color theme
colo gruvbox 
set background=dark

"----- Set aliases to improve efficiency
command W w
command Wq wq
command WQ wq

"----- Set shortcuts in LaTeX documents 
autocmd filetype tex set tw=80
autocmd filetype tex set spell

"----- set the placement of the swap files
set backupdir=~/.backup/,/tmp//
set directory=~/.swp/,/tmp//
set undodir=~/.undo/,/tmp//

"----- set vimtex options

let g:vimtex_fold_enabled = 1
let g:vim_fold_types = {'sections' : {'parse_levels' : 3}}
let g:tex_flavor = 'latex'


"----- coc completion functions from nvim example function
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

set updatetime=300

"----- LanguageServer options

let g:LanguageClient_serverCommands = {'sh': ['bash-language-server', 'start']}
let g:coc_global_extensions = ['coc-vimtex', 'coc-html', 'coc-css', 'coc-highlight', 'coc-python', 'coc-json', 'coc-java', 'coc-vimlsp', 'coc-sh']

