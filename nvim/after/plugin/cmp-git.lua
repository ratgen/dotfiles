local cmp = require('cmp')

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources(
    {
      { name = "ultisnips" },
    },
    {
      { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, 
    {
      { name = 'buffer' },
    }
    )
})

require("cmp_git").setup()
