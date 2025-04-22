vim.cmd("nmap <Leader>t :VimtexTocToggle<CR>")
require('cmp').setup({
  sources = {
    { name = 'vimtex', },
    { name = "path"},
    { name = "ultisnips"}
  },
})
