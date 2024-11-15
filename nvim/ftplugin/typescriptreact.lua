local null_ls = require("null-ls")


null_ls.setup({
    sources = {
      -- null_ls.formatting.eslint_d,
--       null_ls.diagnostics.eslint_d,
--       null_ls.code_actions.eslint_d,
      null_ls.builtins.code_actions.refactoring
    },
})
