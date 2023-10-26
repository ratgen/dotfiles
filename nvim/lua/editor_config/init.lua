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

vim.keymap.set("n", "<C-d>", "<C-d>zz")


local opts = {buffer = bufnr, remap = false}
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "gp", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vtr", function() require('telescope.builtin').lsp_references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
