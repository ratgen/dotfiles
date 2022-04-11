-- Install vim-plug if not found

io.open('~/.config/nvim/autoload/plug.vim', "r")
if f~=nil then 
	io.close(f) 
	
	return true 
else 
	return false 
end


if empty(glob())
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

-- Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
    --VimTeX extension for compiling tex documetns 
    Plug 'lervag/vimtex'                                  
    --Surrounding for quoting and parenthesizing
    Plug 'machakann/vim-sandwich'                         
    --Fuzzy search in files systemwide
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   
    --Fuzzy search in files in vim
    Plug 'junegunn/fzf.vim' 
    --Git commands inside vim
    Plug 'tpope/vim-fugitive'                             
    --Display colors of codes inside .css and .html documents
    Plug 'ap/vim-css-color'                               
    --Bottom line displaying insert and file info
    Plug 'vim-airline/vim-airline'                          
    --Snippets
    Plug 'SirVer/ultisnips'                               
    --Library of snippets for ultisnips
    Plug 'honza/vim-snippets'                             
    --Theme
    Plug 'NLKNguyen/papercolor-theme'

    --lsp configuration for nvim 
    Plug 'neovim/nvim-lspconfig'

    --Autocompletion plugin
    Plug 'hrsh7th/nvim-cmp'
    
    --Rust
    Plug 'simrat39/rust-tools.nvim'

    -- sources for cmp-nvim
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-calc'
    Plug 'hrsh7th/cmp-buffer'

    --Plugin for better syntax highlighting with vue
    Plug 'posva/vim-vue'

    --The bars for each indentation
    Plug 'Yggdroot/indentLine'

    --Expands the targets for 'change inner'
    Plug 'wellle/targets.vim'

    --Autoclosing pairs
    Plug 'Raimondi/delimitMate'

    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
