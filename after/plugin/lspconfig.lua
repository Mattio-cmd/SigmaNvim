vim.lsp.config('pyright', {})

-- Lua LSP: lua_ls with specific settings
vim.lsp.config('lua_ls', {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        }
      })
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
})

-- LaTeX LSP: texlab
vim.lsp.enable('texlab')
vim.lsp.config('texlab', {
  texlab = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
    build = {
      args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      executable = "latexmk",
      forwardSearchAfter = false,
      onSave = false
    },
    chktex = {
      onEdit = false,
      onOpenAndSave = false
    },
    diagnosticsDelay = 300,
    formatterLineLength = 80,
    forwardSearch = { args = {} },
    latexFormatter = "latexindent",
    latexindent = { modifyLineBreaks = false }
  }
})

vim.lsp.config('pyright', { on_attach = on_attach })
vim.lsp.config('lua_ls', { on_attach = on_attach })
vim.lsp.config('texlab', { on_attach = on_attach })
