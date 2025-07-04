local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Remove trailing whitespace on save
local NoWhitespace = exec([[
function! NoWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction
call NoWhitespace()
]], true)

exec([[au BufWritePre * call NoWhitespace()]], false)

-- Disable comments in format options
exec([[au BufEnter * set fo-=c fo-=r fo-=o]], false)

-- Terminal settings
cmd([[
augroup terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * tnoremap <Esc> <c-\><c-n> <cmd>bd!<CR>
augroup END
]])

-- Filetype-specific settings
cmd([[
augroup filetype_settings
    autocmd!
    autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType html setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType scss setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END
]])

-- Restore cursor position on file open
cmd([[
augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
        \ execute "normal! g`\"zvzz" | endif
augroup END
]])

-- Reload file if changed externally
cmd([[
augroup auto_reload_file
    autocmd!
    autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on your device. Buffer reload! Process completed!", 'warn', {'title': 'nvim'})
    autocmd FocusGained,CursorHold * if getcmdwintype() == '' | checktime | endif
augroup END
]])

-- Toggle relative line numbers based on window focus
cmd([[
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END
]])

-- Enable spell checking for specific file types
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- Highlight text after yanking
cmd([[
augroup yank_with_highlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END
]])

-- Nvim-cmp highlights
cmd([[
augroup cmp_highlights
    autocmd!
    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
    highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
    highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
    highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
    highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
augroup END
]])

-- Optional: Floating diagnostic for LSP (commented out)
-- cmd [[
-- autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
-- ]]

-- Dart LSP (commented out)
-- cmd [[
-- let g:lsc_auto_map = v:true
-- ]]

