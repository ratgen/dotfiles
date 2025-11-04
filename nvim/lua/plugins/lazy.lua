vim.g.mapleader = ' '

---@diagnostic disable: missing-fields
require('lazy').setup({
  -- LSP Configuration 
  require("plugins.lsp-config"),

  -- Markdown related plugins
  require("plugins.markdown"),

  -- snacks configuration
  require("plugins.snacks"),

  -- Import dap plugins from the dap.lua file 
  require("plugins.dap"),

  { -- Enhances the lua configuration of nvim, by adding types for plugins
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  --'folke/tokyonight.nvim',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "xiyaowong/transparent.nvim",

  "nvim-treesitter/nvim-treesitter",
  'lervag/vimtex',

  -- Surrounding ,fo quoting and parenthesizing, and additional objects for this
  'machakann/vim-sandwich',
  'wellle/targets.vim',
  'windwp/nvim-autopairs',

  -- Git commands inside vim
  'tpope/vim-fugitive',
  'SirVer/ultisnips',
  'honza/vim-snippets',

  -- Cmdline UI improvement
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
  },


  -- Buttom line pluging
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  -- Plugins for linter attachment
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "gwinn/none-ls-jsonlint.nvim",
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Pluging for refactoring, eg extract function, etc.
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- Plugin for auto opening sessions
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },

  -- Flutter plugin for starting, stopping, etc.
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    modes = {
      mydiags = {
        mode = "diagnostics", -- inherit from diagnostics mode
        filter = {
          any = {
            buf = 0,                                   -- current buffer
            {
              severity = vim.diagnostic.severity.WARN, -- errors only
              -- limit to files in the current project
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
      }
    }
  },
})
