vim.g.mapleader = ' '

require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'folke/trouble.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  { "nvim-telescope/telescope-bibtex.nvim" },

  --'folke/tokyonight.nvim',
  { "catppuccin/nvim",                     name = "catppuccin", priority = 1000 },
  "nvim-treesitter/nvim-treesitter",

  'lervag/vimtex',
  'junegunn/vim-easy-align',

  -- Surrounding for quoting and parenthesizing
  'machakann/vim-sandwich',

  -- Git commands inside vim
  'tpope/vim-fugitive',
  'SirVer/ultisnips',
  'honza/vim-snippets',

  'williamboman/mason-lspconfig.nvim',
  'williamboman/mason.nvim',
  'neovim/nvim-lspconfig',

  -- Autocompletion plugin
  'hrsh7th/nvim-cmp',

  --  sources for cmp-nvim
  'quangnguyen30192/cmp-nvim-ultisnips',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'nvim-lua/plenary.nvim',
  'petertriho/cmp-git',
  'micangl/cmp-vimtex',

  'windwp/nvim-autopairs',

  'Yggdroot/indentLine',
  'wellle/targets.vim',
  'yuezk/vim-js',

  'weirongxu/plantuml-previewer.vim',
  'tyru/open-browser.vim',
  'aklt/plantuml-syntax',

  'nvim-tree/nvim-web-devicons',
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  'onsails/lspkind.nvim',
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  'davidmh/cspell.nvim',
  'nvimtools/none-ls.nvim',
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },
  'ThePrimeagen/harpoon',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-obsession',
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  }
})
