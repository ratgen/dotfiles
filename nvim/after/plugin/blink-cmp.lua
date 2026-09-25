local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

require("mason").setup()
require("mason-lspconfig").setup {
    automatic_enable = {
        exclude = {
        }
    }
}
