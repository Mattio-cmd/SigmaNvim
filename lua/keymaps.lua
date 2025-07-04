local set_keymap = vim.api.nvim_set_keymap

-- Map space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for Luasnip
set_keymap('i', '<C-j>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { expr = true, noremap = true, silent = true })
set_keymap('s', '<C-j>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { expr = true, noremap = true, silent = true })
set_keymap('i', '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { expr = true, noremap = true, silent = true })
set_keymap('s', '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { expr = true, noremap = true, silent = true })

-- Better navigation for omnicomplete
set_keymap('i', '<C-j>', '<C-n>', { expr = true })
set_keymap('i', '<C-k>', '<C-p>', { expr = true })

-- Window resizing with Alt + hjkl
set_keymap('n', '<M-j>', ':resize -2<CR>', { noremap = true })
set_keymap('n', '<M-k>', ':resize +2<CR>', { noremap = true })
set_keymap('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true })
set_keymap('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true })

-- Quick Escape
set_keymap('i', 'jk', '<Esc>', {})
set_keymap('i', 'kj', '<Esc>', {})

-- Alternate Save/Save & Quit
set_keymap('n', '<C-s>', ':w<CR>', { noremap = true })
set_keymap('n', '<C-q>', ':wq!<CR>', { noremap = true })
set_keymap('n', '<S-q>', ':q!<CR>', { noremap = true })

-- Better navigation for tabs and buffers
set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true })
set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true })

-- Markdown Preview
set_keymap('n', '<S-p>', ':MarkdownPreviewToggle<CR>', { noremap = true })

-- Closing buffer (without saving)
set_keymap('n', '<C-x>', ':bw<CR>', { noremap = true })

-- Use Control-C as Escape
set_keymap('n', '<C-c>', '<Esc>', {})

-- Better tabbing behavior
set_keymap('v', '<', '<gv', {})
set_keymap('v', '>', '>gv', {})

-- Center search results and keep context
set_keymap('n', 'n', 'nzzzv', { noremap = true })
set_keymap('n', 'N', 'Nzzzv', { noremap = true })
set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- NvimTree and Quickfix
set_keymap('n', '<C-f>', ':NvimTreeToggle<CR>', { noremap = true })
set_keymap('n', '<leader>l', '<cmd>call setqflist([])<cr>', { noremap = true })

-- Window navigation with Control-hjk;l
set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
set_keymap('n', '<Leader>o', 'o<Esc>^Da', { noremap = true })
set_keymap('n', '<Leader>O', 'O<Esc>^Da', { noremap = true })

-- LSP and Coc definitions
set_keymap('n', '<leader>gd', '<Plug>(coc-definition)', {})
set_keymap('n', '<leader>dr', '<Plug>(coc-references)', {})

-- Telescope keybindings
set_keymap('n', '<C-p>', ':Telescope find_files <CR>', { noremap = true })
set_keymap('n', '<C-o>', ':Telescope live_grep<CR>', { noremap = true })
set_keymap('n', '<C-g>', ':Telescope git_files<CR>', { noremap = true })

-- Terminal keymaps
set_keymap('n', ',,', ':split<CR> :res 5<CR> :term<CR>', { noremap = true })
set_keymap('n', '<leader>p', ':split<CR> :resize 60<CR> :term<CR>', { noremap = true })
set_keymap('n', '<C-v>', ':vsplit<CR>', { noremap = true })
set_keymap('n', '<S-h>', ':split<CR>', { noremap = true })

-- Make Y behave like the rest of capital letters
set_keymap('n', 'Y', 'y$', { noremap = true })

-- Undo breakpoints
set_keymap('i', ',', ',<c-g>u', { noremap = true })
set_keymap('i', '.', '.<c-g>u', { noremap = true })
set_keymap('i', '!', '!<c-g>u', { noremap = true })
set_keymap('i', '?', '?<c-g>u', { noremap = true })

-- Moving text in visual mode
set_keymap('x', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
set_keymap('x', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })
set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', { noremap = true })
set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', { noremap = true })
set_keymap('n', '<leader>j', ':m .+1<CR>==', { noremap = true })
set_keymap('n', '<leader>k', ':m .-2<CR>==', { noremap = true })

-- Alpha greeter
set_keymap('n', '<Leader>d', ':Alpha<CR>', { noremap = true })

-- REPL keymaps
set_keymap('n', '<C-c>', ':hide Repl racket <CR>', { noremap = true })
set_keymap('v', '<C-o>', ':ReplSend<CR>', { noremap = true })

-- Lspsaga keymaps
set_keymap('n', '<S-j>', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
set_keymap('n', '<S-k>', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })
set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
set_keymap('n', 'dh', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
set_keymap('n', 'gp', ':Lspsaga preview_definition<CR>', { noremap = true, silent = true })
set_keymap('n', 'gc', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
set_keymap('n', ';;', ':SymbolsOutline<CR>', { noremap = true, silent = true })

-- Skeletons
set_keymap('n', ',h', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.html<CR>6jwf>a', {})
set_keymap('n', ',c', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.c<CR>4ji<TAB>', {})
set_keymap('n', ',f', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.dart<CR>2j6li', {})
set_keymap('n', ',m', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.make<CR>j4li', {})
set_keymap('n', ',t', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.tex<CR>2j9li', {})
set_keymap('n', ',ti', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.img.tex<CR>2j41li', {})
set_keymap('n', ',d', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.md<CR>1j6l<S-a><Space>', {})
set_keymap('n', ',a', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.ack.c<CR>', {})
set_keymap('n', ',p', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.flask.py<CR>', {})
set_keymap('n', ',ma', ':-1read $HOME/.config/nvim/lua/skeletons/.skeleton.newtonraphson.m<CR>', {})

-- BufferLine
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

-- Sniprun keymaps
set_keymap('x', 'sn', ':SnipRun <CR>', { noremap = true })
set_keymap('n', 'sr', ':SnipReset<CR> :SnipClose<CR>', { noremap = true })

-- Make/Compile commands
set_keymap('n', '<S-m>', ':!cd ..;make;./bin/main <CR>', { noremap = true })

-- Compile LaTeX
set_keymap('n', '<S-z>', ':!pdflatex % && echo "\\n" && exit<CR>', { noremap = true, silent = true })

-- Compile dwm
set_keymap('n', '<S-t>', ':!doas make install', { noremap = true })

-- Debugging with nvim-dap
set_keymap('n', '<leader>dn', ':lua require("dap-python").test_method()<CR>', { noremap = true })
set_keymap('n', '<leader>df', ':lua require("dap-python").test_class()<CR>', { noremap = true })
set_keymap('x', '<leader>ds', '<ESC>:lua require("dap-python").debug_selection()<CR>', { noremap = true })

-- Scroll with center
set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })

-- LaTeX keymaps
set_keymap('n', '<silent>tc', ':!pdflatex -synctex=1 -interaction=nonstopmode --shell-escape main.tex<CR><CR>', { noremap = true })

-- nvim-dap keymaps
set_keymap('n', '<silent><leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
set_keymap('n', '<silent><leader>cd', ':lua require"dap".continue()<CR>', { noremap = true })
set_keymap('n', '<silent><leader>so', ':lua require"dap".step_over()<CR>', { noremap = true })
set_keymap('n', '<silent><leader>i', ':lua require"dap".step_into()<CR>', { noremap = true })
