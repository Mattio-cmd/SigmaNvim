-- General Settings
vim.o.hidden = true                      -- Keep multiple buffers open
vim.o.wrap = false                       -- Display long lines as just one line
vim.o.encoding = 'utf-8'                 -- Encoding displayed
vim.o.fileencoding = 'utf-8'             -- Encoding written to file
vim.o.ruler = true                       -- Show the cursor position all the time
vim.o.cmdheight = 1                      -- More space for displaying messages
vim.o.mouse = 'a'                        -- Enable mouse support
vim.o.splitbelow = true                  -- Horizontal splits below
vim.o.splitright = true                  -- Vertical splits to the right
vim.o.background = 'dark'                -- Set background to dark for colors
vim.o.number = true                      -- Show line numbers
vim.o.relativenumber = true              -- Relative line numbers
vim.o.cursorline = true                  -- Highlight the current line
vim.o.showtabline = 3                    -- Always show tabs
vim.o.showmode = false                   -- Don't show -- INSERT --
vim.o.wildmenu = true                    -- Enable wildmenu for command completion
vim.o.wildmode = 'longest:full,full'     -- Wildmenu completion mode
vim.o.colorcolumn = '110'                -- Highlight color column at 110th char
vim.lsp.set_log_level(vim.lsp.log_levels.INFO)


-- Syntax & Filetype Settings
vim.cmd('syntax enable')                 -- Enable syntax highlighting
vim.g.markdown_fenced_languages = {'typescript', 'c', 'python', 'cpp'} -- Markdown fenced languages
vim.api.nvim_exec([[
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
]], false)

-- Tab & Indentation Settings
vim.o.tabstop = 2                        -- Insert 2 spaces for a tab
vim.o.shiftwidth = 2                     -- Change the number of spaces for indentation
vim.o.smarttab = true                    -- Smart tabbing behavior
vim.o.expandtab = true                   -- Convert tabs to spaces
vim.o.smartindent = true                 -- Smart indentation
vim.o.autoindent = true                  -- Enable auto indent

-- Backup & Write Settings
vim.o.backup = false                     -- Disable backup files
vim.o.writebackup = false                -- Disable write backup
vim.o.swapfile = false                   -- Disable swap files
vim.o.undofile = true                    -- Enable undofile for persistent undo
vim.o.autochdir = true                   -- Change working directory to the file's directory

-- Search Settings
vim.o.incsearch = true                   -- Enable incremental search
vim.o.smartcase = true                   -- Enable smart case search

-- Timeout Settings
vim.o.timeoutlen = 500                   -- Timeout length for mappings (in ms)
vim.o.updatetime = 300                   -- Faster completion (ms)

-- Clipboard & File Handling
vim.o.clipboard = 'unnamedplus'          -- Copy-paste with system clipboard
vim.o.exrc = true                        -- Enable reading .exrc files

-- UI Settings
vim.o.laststatus = 3                     -- Always display the status line
vim.o.pumheight = 10                     -- Make popup menu smaller
vim.o.statusline = '%m %F %m%y %{&fileencoding?&fileencoding:&encoding}%T %=%(C:%c L:%l %P%)' -- Status line format
vim.o.cmdwinheight = 1                   -- Command window height
vim.o.secure = true                      -- Secure the environment (important for exrc files)
vim.o.formatoptions = vim.o.formatoptions:gsub("[cro]", "")  -- Stop newline continuation of comments

-- Other UI Settings
vim.cmd('highlight ColorColumn ctermbg=gray') -- Highlight color column background
vim.o.colorcolumn = '110'                -- Highlight color column at the 110th column

-- Autocommands
vim.api.nvim_exec([[
augroup auto_source
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
augroup END
]], false)

-- Key Mappings
-- For the "w!!" command (write to sudo-protected file)
vim.api.nvim_set_keymap('c', 'w!!', 'w !doas tee %', { noremap = true, silent = true })

-- Insert Header as C files
vim.api.nvim_exec([[
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END
]], false)

-- Set markdown fenced languages
vim.g.markdown_fenced_languages = {'typescript', 'c', 'python', 'cpp'}

-- Other Settings
vim.o.cmdwinheight = 1                  -- Command window height
vim.o.smartcase = true                   -- Smart case search
