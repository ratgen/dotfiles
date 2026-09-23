
local null_ls = require("null-ls")

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- select_refactor shows all available operations as a picker (replaces old code action integration)
vim.keymap.set({ "n", "x" }, "<leader>rs", function()
  require("refactoring").select_refactor()
end)

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
    null_ls.builtins.formatting.dart_format,
    null_ls.builtins.diagnostics.commitlint,
    require("none-ls-jsonlint.diagnostics.jsonlint"),
  }
}
