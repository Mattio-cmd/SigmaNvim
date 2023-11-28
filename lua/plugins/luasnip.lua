require 'lspconfig'.lua_ls.setup{}

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("hello", {
    t('print("Hello world!")')
  })
})
