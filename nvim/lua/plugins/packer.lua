
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use{
    'folke/trouble.nvim',
    requires = { {'nvim-tree/nvim-web-devicons'} }
  }

   use { "nvim-telescope/telescope-bibtex.nvim" }

  use 'folke/tokyonight.nvim'
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

  use 'lervag/vimtex'
  use 'junegunn/vim-easy-align'

  -- Surrounding for quoting and parenthesizing
  use 'machakann/vim-sandwich'                         

  -- Git commands inside vim
  use 'tpope/vim-fugitive'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  use 'williamboman/mason-lspconfig.nvim'
  use 'williamboman/mason.nvim'
  use 'neovim/nvim-lspconfig'

  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'
  
  --  sources for cmp-nvim
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'nvim-lua/plenary.nvim'
  use 'petertriho/cmp-git'
  use 'windwp/nvim-autopairs'

  use 'Yggdroot/indentLine'
  use 'wellle/targets.vim'
  use 'yuezk/vim-js'
  use 'maxmellon/vim-jsx-pretty'
  
  use 'aklt/plantuml-syntax'
  use 'tyru/open-browser.vim'
  use 'weirongxu/plantuml-previewer.vim'

  use 'nvim-tree/nvim-web-devicons'
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
  use 'onsails/lspkind.nvim'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

end)
