local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
    null_ls.builtins.formatting.dart_format,
    null_ls.builtins.diagnostics.commitlint,
    require("none-ls-jsonlint.diagnostics.jsonlint"),
  }
}
