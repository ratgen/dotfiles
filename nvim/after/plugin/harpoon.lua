local opts = {buffer = bufnr, remap = false}
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, opts)
vim.keymap.set("n", "<leader>q", function() require("harpoon.ui").toggle_quick_menu() end, opts)

vim.keymap.set("n", "<leader>n", function() require("harpoon.ui").nav_prev() end, opts)
vim.keymap.set("n", "<leader>m", function() require("harpoon.ui").nav_next() end, opts)


vim.keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end, opts)
vim.keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end, opts)
vim.keymap.set("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end, opts)
vim.keymap.set("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end, opts)
vim.keymap.set("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end, opts)
vim.keymap.set("n", "<leader>6", function() require("harpoon.ui").nav_file(6) end, opts)
vim.keymap.set("n", "<leader>7", function() require("harpoon.ui").nav_file(7) end, opts)
vim.keymap.set("n", "<leader>8", function() require("harpoon.ui").nav_file(8) end, opts)
vim.keymap.set("n", "<leader>9", function() require("harpoon.ui").nav_file(9) end, opts)


vim.keymap.set("n", "<leader>t1", function() require("harpoon.term").gotoTerminal(1) end, opts)
vim.keymap.set("n", "<leader>t2", function() require("harpoon.term").gotoTerminal(2) end, opts)
vim.keymap.set("n", "<leader>t3", function() require("harpoon.term").gotoTerminal(3) end, opts)
