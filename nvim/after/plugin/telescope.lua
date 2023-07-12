local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {}) 

vim.keymap.set('n', '<leader>b', "<cmd>Telescope bibtex<CR>" , {})

local telescope = require('telescope')

telescope.load_extension("bibtex")

telescope.setup {
    load_extensions = { "yank_history", "bibtex" },
    extensions = {
      bibtex = {
        depth = 1,
        -- Depth for the *.bib file
        custom_formats = {},
        -- Custom format for citation label
        format = '',
        -- Format to use for citation label.
        -- Try to match the filetype by default, or use 'plain'
        -- Path to global bibliographies (placed outside of the project)
        search_keys = { 'author', 'year', 'title' },
        -- Define the search keys to use in the picker
        citation_format = '{{author}} ({{year}}), {{title}}.',
        -- Template for the formatted citation
        citation_trim_firstname = true,
        -- Only use initials for the authors first name
        citation_max_auth = 2,
        -- Max number of authors to write in the formatted citation
        -- following authors will be replaced by "et al."
        context = false,
        -- Context awareness disabled by default
        context_fallback = true,
        -- Fallback to global/directory .bib files if context not found
        -- This setting has no effect if context = false
        wrap = false,
        -- Wrapping in the preview window is disabled by default
      },
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
  },
}
