-- Keymaps
-- --Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

vim.cmd [[
" Better nav for omnicomplete
"inoremap <expr> <c-j> ("\<C-n>")
"inoremap <expr> <c-k> ("\<C-p>")
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Markdown Preview
nnoremap <S-p> :MarkdownPreviewToggle<CR>
" Alternate way to save
nnoremap <C-s> :w<CR> " Alternate way to quit and save nnoremap
nnoremap <C-q> :wq!<CR> " Alternative way to quit
nnoremap <S-q> :q!<CR> " Foce quit
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" For keeping search results centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" For NvimTree
nnoremap <C-f> :NvimTreeToggle<CR>
nnoremap <leader>l <cmd>call setqflist([])<cr>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
" Close ONE single buffer BUT it will not be saved unless you do C-s
nnoremap <C-x> :bw<cr>
" Coc definitions
map <leader>gd <Plug>(coc-definition)
nmap <leader>dr <Plug>(coc-references)

nnoremap <C-p> :Telescope find_files <CR>
nnoremap <C-o> :Telescope live_grep<CR>
nmap <C-g> :Telescope git_files<CR>

" For the terminal
noremap ,, :split<CR> :res 5<CR> :term<CR>
" For the BIG terminal
noremap <leader>p :split<CR> :resize 60<CR> :term<CR>
" For spliting windows
nnoremap <C-v> :vsplit<CR>
nnoremap <S-h> :split<CR>
" Make Y behave like the rest of the capiptal letters.
nnoremap Y y$
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" For alpha greeter
nnoremap <Leader>d :Alpha<CR>
" For Repl
nnoremap  <C-c> :hide Repl racket <CR>
vnoremap  <C-o> :ReplSend<CR>
" lspsaga aka pain
nnoremap <silent> <S-j> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <S-k> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> dh :Lspsaga hover_doc<CR>
nnoremap <silent> gp :Lspsaga preview_definition<CR>
nnoremap <silent> gc :Lspsaga code_action<CR>
nnoremap ;; :SymbolsOutline<CR>
" For the skeletons
" Read an empty HTML template and move cursor to title
nnoremap ,h :-1read $HOME/.config/nvim/lua/skeletons/.skeleton.html<CR>3jwf>a
nnoremap ,c :-1read $HOME/.config/nvim/lua/skeletons/.skeleton.c<CR>4ji<TAB>
nnoremap ,f :-1read $HOME/.config/nvim/lua/skeletons/.skeleton.dart<CR>2j6li
nnoremap ,m :-1read $HOME/.config/nvim/lua/skeletons/.skeleton.make<CR>j4li
nnoremap ,t :-1read $HOME/.config/nvim/lua/skeletons/.skeleton.tex<CR>2j9li
nnoremap ,d :-1read $HOME/.config/nvim/lua/skeletons/.skeleton.md<CR>1j6l<S-a><Space>

" For flutter development
nnoremap ;f :FlutterOutlineToggle<CR>
nnoremap ff :FlutterRun<CR>
nnoremap fq :FlutterQuit<CR>
nnoremap fr :FlutterReload<CR>
nnoremap frr :FlutterRestart<CR>

" For bufferline
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" For sniprun
vnoremap sn :SnipRun <CR>
nnoremap sr :SnipReset<CR> :SnipClose<CR>

" For dap-nvim
nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
	"map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	"map <leader>p :!opout <c-r>%<CR><CR>

]]
