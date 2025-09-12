
local null_ls = require("null-ls")

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    -- …other langs…
  },
  highlight = { enable = true },
  indent    = { enable = true },
})

require("refactoring").setup({})

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    null_ls.builtins.code_actions.refactoring.with({
      filetypes = { "python" },
    }),
  }
}
