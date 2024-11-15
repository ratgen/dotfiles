local null_ls = require("null-ls")


null_ls.setup({
  sources = {
    null_ls.builtins.formatting.fixjson,
    require("none-ls-jsonlint.diagnostics.jsonlint"),
  },
})
