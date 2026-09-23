return {
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { { 'williamboman/mason.nvim', opts = {} } },
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_no_maps = true
    end,
    config = function()
      -- Suggestions come through blink-copilot in the completion menu, so
      -- replace copilot.vim's autocmds to stop its inline ghost text
      vim.api.nvim_create_augroup("github_copilot", { clear = true })
      vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
        group = "github_copilot",
        callback = function(args)
          vim.fn["copilot#On" .. args.event]()
        end,
      })
      vim.fn["copilot#OnFileType"]()
    end,
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'fang2hou/blink-copilot',
      "bydlw98/blink-cmp-sshconfig",
      "mgalliou/blink-cmp-tmux",
      "bydlw98/blink-cmp-env",
      'disrupted/blink-cmp-conventional-commits',
      'Kaiser-Yang/blink-cmp-git',
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',

    opts = {
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      keymap = { preset = 'enter' },
      signature = { enabled = true },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'normal'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = true } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'copilot', 'lsp', 'path', 'snippets', 'tmux', 'buffer', 'env' },
        per_filetype = {
          gitcommit = { 'git', 'conventional_commits', inherit_defaults = true },
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          tmux = {
            module = "blink-cmp-tmux",
            name = "tmux",
            -- default options
            opts = {
              all_panes = false,
              capture_history = false,
              -- only suggest completions from `tmux` if the `trigger_chars` are
              -- used
              triggered_only = false,
              trigger_chars = { "." }
            },
          },
          env = {
            name = "Env",
            module = "blink-cmp-env",
            --- @type blink-cmp-env.Options
            opts = {
              show_braces = false,
              show_documentation_window = true,
            },
          },
          conventional_commits = {
            name = 'Conventional Commits',
            module = 'blink-cmp-conventional-commits',
            ---@module 'blink-cmp-conventional-commits'
            ---@type blink-cmp-conventional-commits.Options
          },
          git = {
            module = "blink-cmp-git",
            name = "Git",
            opts = {
              git_centers = {
                gitlab = {
                  issue = {
                    enable = function()
                      local enable = require("blink-cmp-git.default.gitlab").issue.enable()
                      local utils = require("blink-cmp-git.utils")
                      return enable or utils.get_repo_remote_url():find("gitlab.sdu.dk", 1, true)
                    end,
                    get_command_args = function(command, token)
                      local d = require("blink-cmp-git.default.gitlab").issue
                      local args = d.get_command_args(command, token)

                      -- For glab, inject: --hostname gitlab.sdu.dk
                      if command ~= "curl" then
                        local endpoint = args[#args]
                        args[#args] = nil
                        table.insert(args, "--hostname")
                        table.insert(args, "gitlab.sdu.dk")
                        table.insert(args, endpoint)
                      end
                      return args
                    end,
                  },

                  -- NOTE: still called pull_request even though GitLab uses merge requests
                  pull_request = {
                    enable = function()
                      local enable = require("blink-cmp-git.default.gitlab").pull_request.enable()
                      local utils = require("blink-cmp-git.utils")
                      return enable or utils.get_repo_remote_url():find("gitlab.sdu.dk", 1, true)
                    end,
                    get_command_args = function(command, token)
                      local d = require("blink-cmp-git.default.gitlab").pull_request
                      local args = d.get_command_args(command, token)
                      if command ~= "curl" then
                        local endpoint = args[#args]
                        args[#args] = nil
                        table.insert(args, "--hostname")
                        table.insert(args, "gitlab.sdu.dk")
                        table.insert(args, endpoint)
                      end
                      return args
                    end,
                  },

                  mention = {
                    enable = function()
                      local enable = require("blink-cmp-git.default.gitlab").mention.enable()
                      local utils = require("blink-cmp-git.utils")
                      return enable or utils.get_repo_remote_url():find("gitlab.sdu.dk", 1, true)
                    end,
                    get_command_args = function(command, token)
                      local d = require("blink-cmp-git.default.gitlab").mention
                      local args = d.get_command_args(command, token)
                      if command ~= "curl" then
                        local endpoint = args[#args]
                        args[#args] = nil
                        table.insert(args, "--hostname")
                        table.insert(args, "gitlab.sdu.dk")
                        table.insert(args, endpoint)
                      end
                      return args
                    end,
                  },
                },
              },
            },
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}
