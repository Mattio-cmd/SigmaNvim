local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
map({ "n", "v" }, "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Helpers
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
      :sub(col, col)
      :match("%s") == nil
end

-- Insert-mode smart <C-j> / <C-k>
map("i", "<C-j>", function()
  local ls = require("luasnip")
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  elseif vim.fn.pumvisible() == 1 then
    return "<C-n>"
  else
    return "<Esc>:m .+1<CR>==gi"
  end
end, { expr = true, silent = true })

map("i", "<C-k>", function()
  local ls = require("luasnip")
  if ls.jumpable(-1) then
    ls.jump(-1)
  elseif vim.fn.pumvisible() == 1 then
    return "<C-p>"
  else
    return "<Esc>:m .-2<CR>==gi"
  end
end, { expr = true, silent = true })

-- Select-mode Luasnip
map("s", "<C-j>", function()
  require("luasnip").expand_or_jump()
end, opts)

map("s", "<C-k>", function()
  require("luasnip").jump(-1)
end, opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window resizing
map("n", "<M-h>", ":vertical resize -2<CR>", opts)
map("n", "<M-l>", ":vertical resize +2<CR>", opts)
map("n", "<M-j>", ":resize -2<CR>", opts)
map("n", "<M-k>", ":resize +2<CR>", opts)

-- Escape & basic QoL
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
map("n", "Y", "y$", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
map("v", "<", "<gv")
map("v", ">", ">gv")
map("i", "<C-e>", "<C-o>$", opts) -- Jumps to end of line during insert mode
map("i", "<C-BS>", "<C-o>db", opts) -- Delete previous word without leaving insert mode

-- Save / Quit
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":wq!<CR>", opts)
map("n", "<S-q>", ":q!<CR>", opts)

-- Buffers & tabs
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<C-x>", ":bw<CR>", opts)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<C-o>", ":Telescope live_grep<CR>", opts)
map("n", "<C-g>", ":Telescope git_files<CR>", opts)

-- File tree & quickfix
map("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>l", function()
  vim.fn.setqflist({})
end, opts)

-- Terminal
map("n", ",,", ":split<CR>:res 5<CR>:term<CR>", opts)
map("n", "<leader>[", ":split<CR>:resize 60<CR>:term<CR>", opts)
map("n", "<C-v>", ":vsplit<CR>", opts)
map("n", "<S-h>", ":split<CR>", opts)

-- Move lines
map("x", "J", ":m '>+1<CR>gv=gv", opts)
map("x", "K", ":m '<-2<CR>gv=gv", opts)
map("n", "<leader>j", ":m .+1<CR>==", opts)
map("n", "<leader>k", ":m .-2<CR>==", opts)

-- LSP / Coc
map("n", "<leader>gd", "<Plug>(coc-definition)")
map("n", "<leader>dr", "<Plug>(coc-references)")

-- Lspsaga
map("n", "<S-j>", ":Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "<S-k>", ":Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "gh", ":Lspsaga lsp_finder<CR>", opts)
map("n", "dh", ":Lspsaga hover_doc<CR>", opts)
map("n", "gp", ":Lspsaga preview_definition<CR>", opts)
map("n", "gc", ":Lspsaga code_action<CR>", opts)
map("n", ";;", ":SymbolsOutline<CR>", opts)

-- SnipRun
map("x", "sn", ":SnipRun<CR>", opts)
map("n", "sr", ":SnipReset<CR>:SnipClose<CR>", opts)

-- Alpha
map("n", "<leader>d", ":Alpha<CR>", opts)

-- BufferLine
for i = 1, 9 do
  map("n", "<leader>" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
end
