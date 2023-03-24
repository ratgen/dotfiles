local cmp = require('cmp')

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

