---@diagnostic disable: missing-fields
require('lazy').setup({
  -- LSP Configuration
  require("plugins.lsp-config"),

  -- snacks configuration
  require("plugins.snacks"),

  -- Import dap plugins from the dap.lua file
  require("plugins.dap"),

  -- Markdown rendering
  require("plugins.markdown"),

  {             -- Enhances the lua configuration of nvim, by adding types for plugins
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

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  "xiyaowong/transparent.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      install_dir = vim.fn.stdpath("data") .. "/site",
    },
    config = function(_, opts)
      local ts = require("nvim-treesitter")
      ts.setup(opts)
      ts.install({
        "lua", "vim", "vimdoc", "query", "bash", "json", "yaml", "toml",
        "python", "javascript", "typescript", "tsx", "dart", "php", "sql",
        "latex", "bibtex", "markdown", "markdown_inline", "gitcommit", "diff",
      })
      -- The main branch no longer enables highlighting on its own
      vim.api.nvim_create_autocmd("FileType", {
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },
  'lervag/vimtex',

  -- Surrounding ,fo quoting and parenthesizing, and additional objects for this
  'machakann/vim-sandwich',
  'wellle/targets.vim',
  'windwp/nvim-autopairs',

  -- Git commands inside vim
  'tpope/vim-fugitive',

  -- Cmdline UI improvement
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
  },


  -- Buttom line pluging
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
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
    dependencies = {
      "lewis6991/async.nvim",
    },
    config = function()
      require("refactoring").setup()
    end,
    keys = {
      { "<leader>re",  ":Refactor extract ",         mode = "x",          desc = "Extract function" },
      { "<leader>rf",  ":Refactor extract_to_file ", mode = "x",          desc = "Extract function to file" },
      { "<leader>rv",  ":Refactor extract_var ",     mode = "x",          desc = "Extract variable" },
      { "<leader>ri",  ":Refactor inline_var",       mode = { "n", "x" }, desc = "Inline variable" },
      { "<leader>rI",  ":Refactor inline_func",                           desc = "Inline function" },
      { "<leader>rb",  ":Refactor extract_block",                         desc = "Extract block" },
      { "<leader>rbf", ":Refactor extract_block_to_file",                 desc = "Extract block to file" },
      -- select_refactor shows all available operations as a picker
      { "<leader>rs",  function() require("refactoring").select_refactor() end, mode = { "n", "x" }, desc = "Select refactor" },
    },
  },

  -- Plugin for auto opening sessions
  {
    'rmagatti/auto-session',
    lazy = false,
    init = function()
      -- Must be set before auto-session loads; it checks for localoptions
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,

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
    ft = "dart",
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        mydiags = {
          mode = "diagnostics", -- inherit from diagnostics mode
          filter = {
            any = {
              buf = 0,                                   -- current buffer
              {
                severity = vim.diagnostic.severity.WARN,
                -- limit to files in the current project
                function(item)
                  return item.filename:find(vim.uv.cwd(), 1, true)
                end,
              },
            },
          },
        },
      },
    },
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
  },
})
