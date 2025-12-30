-- Set LSP log level to "debug"
vim.lsp.set_log_level("debug")

-- Python LSP: Pyright
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

-- HTML LSP with completion and embedded languages support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config('html', {
  capabilities = capabilities,
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = { css = true, javascript = true },
  provideFormatter = true
})

-- C/C++ LSP: clangd
vim.lsp.config('clangd', {})

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

-- SystemVerilog LSP: verible
vim.lsp.config('verible', {})

-- Rust LSP: rust_analyzer
vim.lsp.config('rust_analyzer', {})

-- TypeScript LSP: ts_ls (TypeScript Language Server)
vim.lsp.config('ts_ls', {})

-- CSS LSP: cssls
vim.lsp.config('cssls', {
  capabilities = capabilities,
})

-- Use a custom on_attach function to bind keymaps for LSP actions
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- LSP keybindings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Add the on_attach function to each server configuration (if applicable)
vim.lsp.config('pyright', { on_attach = on_attach })
vim.lsp.config('lua_ls', { on_attach = on_attach })
vim.lsp.config('html', { on_attach = on_attach })
vim.lsp.config('clangd', { on_attach = on_attach })
vim.lsp.config('texlab', { on_attach = on_attach })
vim.lsp.config('verible', { on_attach = on_attach })
vim.lsp.config('rust_analyzer', { on_attach = on_attach })
vim.lsp.config('ts_ls', { on_attach = on_attach })
vim.lsp.config('cssls', { on_attach = on_attach })
