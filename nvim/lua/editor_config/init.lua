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
