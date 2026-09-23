require('lualine').setup{
  sections = {
    lualine_x = {
      -- Shows e.g. "recording @q", which noice hides from the cmdline
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = "#ff9e64" },
      },
      -- lualine's defaults, which setting lualine_x would otherwise drop
      'encoding',
      'fileformat',
      'filetype',
    },
  },
  options = {
    theme = 'catppuccin-mocha'
  }
}
