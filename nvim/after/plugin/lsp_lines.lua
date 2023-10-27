vim.diagnostic.config({
  virtual_text = false,
})
require("lsp_lines").setup()
vim.diagnostic.config({ virtual_lines = true })
