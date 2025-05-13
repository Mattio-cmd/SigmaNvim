--false Always display the status line
vim.o.laststatus = 3

-- Enables syntax highlighting
vim.cmd('syntax enable')

-- Required to keep multiple buffers open multiple buffers
vim.o.hidden = true

-- Display long lines as just one line
vim.o.wrap = false

-- The encoding displayed
vim.o.encoding = 'utf-8'

-- Makes popup menu smaller
vim.o.pumheight = 10

-- The encoding written to file
vim.o.fileencoding = 'utf-8'

-- Show the cursor position all the time
vim.o.ruler = true

-- More space for displaying messages
vim.o.cmdheight = 1

-- Treat dash separated words as a word text object
--vim.o.iskeyword = vim.o.iskeyword .. '-'

-- Enable your mouse
vim.o.mouse = 'a'

-- Horizontal splits will automatically be below
vim.o.splitbelow = true

-- Vertical splits will automatically be to the right
vim.o.splitright = true

-- Support 256 colors
--vim.o.t_Co = 256

-- So that I can see ` conceal level in markdown files
vim.o.conceallevel = 0

-- Insert 2 spaces for a tab
vim.o.tabstop = 2

-- Change the number of space characters inserted for indentation
vim.o.shiftwidth = 2

-- Makes tabbing smarter will realize you have 2 vs 4
vim.o.smarttab = true

-- Converts tabs to spaces
vim.o.expandtab = true

-- Makes indenting smart
vim.o.smartindent = true

-- Good auto indent
vim.o.autoindent = true

-- Status line configuration
vim.o.statusline = '%m %F %m%y %{&fileencoding?&fileencoding:&encoding}%T %=%(C:%c L:%l %P%)'

-- Line numbers
vim.o.number = true

-- Enable highlighting of the current line
vim.o.cursorline = true

-- Tell Neovim what the background color looks like
vim.o.background = 'dark'

-- Always show tabs
vim.o.showtabline = 3

-- We don't need to see things like -- INSERT -- anymore
vim.o.showmode = false

-- This is recommended by coc
vim.o.backup = false

-- This is recommended by coc
vim.o.writebackup = false

-- Faster completion
vim.o.updatetime = 300

-- By default timeoutlen is 1000 ms
vim.o.timeoutlen = 500

-- Stop newline continuation of comments
vim.o.formatoptions = vim.o.formatoptions:gsub("[cro]", "")

-- Copy paste between Neovim and everything else
vim.o.clipboard = 'unnamedplus'

-- Your working directory will always be the same as your working directory
vim.o.autochdir = true

-- Enable reading .exrc files
vim.o.exrc = true

vim.o.cmdwinheight = 1
vim.o.wildmenu = true
--vim.o.nolist = true
vim.o.wildmode = 'longest:full,full'
vim.o.secure = true
vim.o.relativenumber = true
vim.o.colorcolumn = '110'
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.incsearch = true

-- Highlight ColorColumn background
vim.cmd('highlight ColorColumn ctermbg=gray')

-- Auto source when writing to init.vim; alternatively, you can run :source $MYVIMRC
vim.api.nvim_exec([[
augroup auto_source
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
augroup END
]], false)

-- You can't stop me
vim.api.nvim_set_keymap('c', 'w!!', 'w !doas tee %', { noremap = true, silent = true })

-- Header files would be recognized as cpp
vim.api.nvim_exec([[
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
]], false)

-- Set markdown fenced languages
vim.g.markdown_fenced_languages = {'typescript', 'c', 'python', 'cpp'}
