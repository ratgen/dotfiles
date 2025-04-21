local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.autoindent = true
set.smartindent = true
set.expandtab = true
set.incsearch = true
set.hlsearch = true

set.relativenumber = true
set.number = true
set.confirm = true

set.cursorline = true
set.mouse = nil

set.scrolloff = 10
set.signcolumn = "yes"

set.textwidth = 80
set.termguicolors = true
set.updatetime = 50

set.modeline = true

local opts = { buffer = bufnr, remap = false }
--vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
--vim.keymap.set("n", "gp", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("x", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
--vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
--vim.keymap.set("n", "<leader>lr", function() require('telescope.builtin').lsp_references() end, opts)
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

vim.keymap.set("n", "<leader>e", function()
  vim.lsp.buf.format {
    filter = function(client) return client.name ~= "tsserver" end
  }
end, opts)


vim.diagnostic.config({
  virtual_text = false,
})

set.conceallevel = 0
