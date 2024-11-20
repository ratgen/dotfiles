local null_ls = require("null-ls")


null_ls.setup({
    sources = {
      require("none-ls.formatting.eslint_d"),
      require("none-ls.diagnostics.eslint_d"),
      require("none-ls.code_actions.eslint_d"),
      null_ls.builtins.code_actions.refactoring
    },
})
