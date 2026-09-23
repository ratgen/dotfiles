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
set.mouse = ""

set.scrolloff = 10
set.signcolumn = "yes"

set.textwidth = 80
set.termguicolors = true
set.updatetime = 250

set.modeline = true

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
  callback = function(args)
    local function map(mode, lhs, rhs, map_opts)
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { buffer = args.buf }, map_opts or {}))
    end

    map({ "n", "x" }, "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
    map("n", "<leader>rn", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "Rename" })

    map("n", "<leader>e", function()
      vim.lsp.buf.format {
        filter = function(client) return client.name ~= "ts_ls" end
      }
    end, { desc = "Format" })

    map("n", "<leader>ul", function()
      vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
    end, { desc = "Toggle code lens" })
  end,
})

-- Show diagnostics as lines below the code (built in since Neovim 0.11)
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})

set.conceallevel = 0
