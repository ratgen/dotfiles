local cmp = require('cmp')

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  completion = { autocomplete = false },

  -- mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
 -- mapping = cmp.mapping.preset.cmdline(),
  completion = { autocomplete = false },
  sources = cmp.config.sources({
    { name = 'path' }
    }, {
      { name = 'cmdline',
    }
  })
})

