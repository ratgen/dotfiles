vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local opts = {buffer = bufnr, remap = false}
require("nvim-tree.api").tree.close()
 vim.keymap.set("n", "<leader>fm", function() require("nvim-tree.api").tree.toggle() end, opts)
