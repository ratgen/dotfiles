return {
  {
    'weirongxu/plantuml-previewer.vim',
    ft = { "markdown"}
  },
  {
    'tyru/open-browser.vim',
    ft = { "markdown" }
  },
  {
    'aklt/plantuml-syntax',
    ft = { "markdown" }
  },
  {
     "iamcco/markdown-preview.nvim",
     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
     ft = { "markdown" },
     build = function() vim.fn["mkdp#util#install"]() end,
   },
}
