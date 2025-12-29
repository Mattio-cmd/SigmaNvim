local api = vim.api

-- Helper: augroup
local function augroup(name)
  return api.nvim_create_augroup(name, { clear = true })
end

-- Remove trailing whitespace on save
local function trim_trailing_whitespace()
  local view = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(view)
end

api.nvim_create_autocmd("BufWritePre", {
  group = augroup("trim_whitespace"),
  callback = trim_trailing_whitespace,
})

-- Disable automatic comment insertion
api.nvim_create_autocmd("BufEnter", {
  group = augroup("format_options"),
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Terminal settings
api.nvim_create_autocmd("TermOpen", {
  group = augroup("terminal"),
  callback = function()
    vim.cmd("startinsert")
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n><cmd>bd!<CR>]], {
      buffer = true,
      silent = true,
    })
  end,
})

-- Filetype-specific settings
api.nvim_create_autocmd("FileType", {
  group = augroup("filetype_settings"),
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

api.nvim_create_autocmd("FileType", {
  group = augroup("filetype_settings"),
  pattern = { "html", "scss" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Restore cursor position on file open
api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_cursor_position"),
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)

    if mark[1] > 1 and mark[1] <= lcount and vim.bo.filetype ~= "commit" then
      vim.cmd([[normal! g`"zvzz]])
    end
  end,
})

-- Reload file if changed externally
api.nvim_create_autocmd("FileChangedShellPost", {
  group = augroup("auto_reload_file"),
  callback = function()
    vim.notify(
      "File changed on your device. Buffer reload completed.",
      vim.log.levels.WARN,
      { title = "nvim" }
    )
  end,
})

api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
  group = augroup("auto_reload_file"),
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- Toggle relative line numbers
api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
  {
    group = augroup("numbertoggle"),
    callback = function()
      if vim.wo.number then
        vim.wo.relativenumber = true
      end
    end,
  }
)

api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
  {
    group = augroup("numbertoggle"),
    callback = function()
      if vim.wo.number then
        vim.wo.relativenumber = false
      end
    end,
  }
)

-- Enable spell checking for text files
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("spellcheck"),
  pattern = { "*.txt", "*.md", "*.tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Highlight yanked text
api.nvim_create_autocmd("TextYankPost", {
  group = augroup("yank_highlight"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- nvim-cmp highlights (colorscheme-safe)
api.nvim_create_autocmd("ColorScheme", {
  group = augroup("cmp_highlights"),
  callback = function()
    local set = vim.api.nvim_set_hl

    set(0, "CmpItemAbbrDeprecated", { fg = "#808080", strikethrough = true })
    set(0, "CmpItemAbbrMatch", { fg = "#569CD6" })
    set(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })
    set(0, "CmpItemKindVariable", { fg = "#9CDCFE" })
    set(0, "CmpItemKindInterface", { fg = "#9CDCFE" })
    set(0, "CmpItemKindText", { fg = "#9CDCFE" })
    set(0, "CmpItemKindFunction", { fg = "#C586C0" })
    set(0, "CmpItemKindMethod", { fg = "#C586C0" })
    set(0, "CmpItemKindKeyword", { fg = "#D4D4D4" })
    set(0, "CmpItemKindProperty", { fg = "#D4D4D4" })
    set(0, "CmpItemKindUnit", { fg = "#D4D4D4" })
  end,
})
