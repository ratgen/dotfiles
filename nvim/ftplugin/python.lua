local null_ls = require("null-ls")
null_ls.setup({
  sources = {
--      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.code_actions.refactoring
  },
})
local cmp = require('cmp')
local sources = cmp.get_config().sources
for i = #sources, 1, -1 do
  if sources[i].name == 'copilot' then
    table.remove(sources, i)
  end
end
cmp.setup.buffer({ sources = sources })
