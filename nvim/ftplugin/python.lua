local null_ls = require("null-ls")

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    -- …other langs…
  },
  highlight = { enable = true },
  indent    = { enable = true },
})

require('refactoring').setup({})

null_ls.setup({
  sources = {
      null_ls.builtins.code_actions.refactoring.with({
        filetypes = { "python" },
    }),
  },
})
