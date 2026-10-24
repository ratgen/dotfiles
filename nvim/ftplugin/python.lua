
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    -- …other langs…
  },
  highlight = { enable = true },
  indent    = { enable = true },
})

require('refactoring').setup({})

