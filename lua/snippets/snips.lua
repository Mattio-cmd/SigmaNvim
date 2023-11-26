local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('tex', {
  s('template', t('EJEMPLO EXITOSO'))
})
