-- Keymaps
-- --Remap space as leader key
local set_keymap = vim.api.nvim_set_keymap

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}


set_keymap('i', '<C-j>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { expr = true, noremap = true, silent = true })
set_keymap('s', '<C-j>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { expr = true, noremap = true, silent = true })
set_keymap('i', '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { expr = true, noremap = true, silent = true })
set_keymap('s', '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { expr = true, noremap = true, silent = true })

-- Better nav for omnicomplete
vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', { expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', { expr = true })

-- Use alt + hjkl to resize windows
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true })

-- I hate escape more than anything else
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {})

-- Easy CAPS
-- vim.api.nvim_set_keymap('i', '<C-u>', '<Esc>viwUi', {})
-- vim.api.nvim_set_keymap('n', '<C-u>', 'viwU<Esc>', {})

-- TAB in general mode will move to the next buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true })
-- SHIFT-TAB will go to the previous buffer
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true })

-- Markdown Preview
vim.api.nvim_set_keymap('n', '<S-p>', ':MarkdownPreviewToggle<CR>', { noremap = true })

-- Alternate way to save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
-- Alternate way to quit and save
vim.api.nvim_set_keymap('n', '<C-q>', ':wq!<CR>', { noremap = true })
-- Force quit
vim.api.nvim_set_keymap('n', '<S-q>', ':q!<CR>', { noremap = true })

-- Use control-c instead of escape
vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', {})

-- Better tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', {})
vim.api.nvim_set_keymap('v', '>', '>gv', {})

-- For keeping search results centered
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- For NvimTree
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>call setqflist([])<cr>', { noremap = true })

-- Better window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>^Da', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>^Da', { noremap = true })

-- Close ONE single buffer BUT it will not be saved unless you do C-s
vim.api.nvim_set_keymap('n', '<C-x>', ':bw<CR>', { noremap = true })
-- Coc definitions
vim.api.nvim_set_keymap('n', '<leader>gd', '<Plug>(coc-definition)', {})
vim.api.nvim_set_keymap('n', '<leader>dr', '<Plug>(coc-references)', {})

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-o>', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope git_files<CR>', { noremap = true })

-- For the terminal
vim.api.nvim_set_keymap('n', ',,', ':split<CR> :res 5<CR> :term<CR>', { noremap = true })
-- For the BIG terminal
vim.api.nvim_set_keymap('n', '<leader>p', ':split<CR> :resize 60<CR> :term<CR>', { noremap = true })
-- For splitting windows
vim.api.nvim_set_keymap('n', '<C-v>', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':split<CR>', { noremap = true })

-- Make Y behave like the rest of the capital letters.
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Undo break points
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true })

-- Moving text
vim.api.nvim_set_keymap('x', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('x', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':m .-2<CR>==', { noremap = true })

-- For alpha greeter
vim.api.nvim_set_keymap('n', '<Leader>d', ':Alpha<CR>', { noremap = true })

-- For Repl
vim.api.nvim_set_keymap('n', '<C-c>', ':hide Repl racket <CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-o>', ':ReplSend<CR>', { noremap = true })

-- Lspsaga
vim.api.nvim_set_keymap('n', '<S-j>', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-k>', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dh', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gp', ':Lspsaga preview_definition<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gc', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';;', ':SymbolsOutline<CR>', { noremap = true, silent = true })

-- For the skeletons
vim.api.nvim_set_keymap('n', ',h', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.html<CR>6jwf>a', {})
vim.api.nvim_set_keymap('n', ',c', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.c<CR>4ji<TAB>', {})
vim.api.nvim_set_keymap('n', ',f', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.dart<CR>2j6li', {})
vim.api.nvim_set_keymap('n', ',m', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.make<CR>j4li', {})
vim.api.nvim_set_keymap('n', ',t', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.tex<CR>2j9li', {})
vim.api.nvim_set_keymap('n', ',ti', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.img.tex<CR>2j41li', {})
vim.api.nvim_set_keymap('n', ',d', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.md<CR>1j6l<S-a><Space>', {})
vim.api.nvim_set_keymap('n', ',a', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.ack.c<CR>', {})
vim.api.nvim_set_keymap('n', ',p', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.flask.py<CR>', {})

-- For bufferline
vim.cmd[[
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
]]

-- For sniprun
vim.api.nvim_set_keymap('x', 'sn', ':SnipRun <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sr', ':SnipReset<CR> :SnipClose<CR>', { noremap = true })

-- Make
vim.api.nvim_set_keymap('n', '<S-m>', ':!cd ..;make;./bin/main <CR>', { noremap = true })

-- Compile LaTeX to pdf
vim.api.nvim_set_keymap('n', '<S-z>', ':!pdflatex main.tex <CR> :!pdflatex main.tex <CR> <CR> <CR> <CR>', { noremap = true })

-- Compile dwm
vim.api.nvim_set_keymap('n', '<S-t>', ':!doas make install', { noremap = true })

-- Find and replace idk
-- vim.api.nvim_set_keymap('n', '<>', ':%s/x/y/g', { noremap = true })

-- For dap-nvim
vim.api.nvim_set_keymap('n', '<leader>dn', ':lua require("dap-python").test_method()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>df', ':lua require("dap-python").test_class()<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>ds', '<ESC>:lua require("dap-python").debug_selection()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })

-- TeX
vim.api.nvim_set_keymap('n', '<silent>tc', ':!pdflatex -synctex=1 -interaction=nonstopmode --shell-escape main.tex<CR><CR>', { noremap = true })

-- nvim-dap
vim.api.nvim_set_keymap('n', '<silent><leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent><leader>cd', ':lua require"dap".continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent><leader>so', ':lua require"dap".step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<silent><leader>i', ':lua require"dap".step_into()<CR>', { noremap = true })
