vim.cmd [[
" Plugin Configuration: {{{1 "
" zepl {{{ "2
set hidden
augroup zepl
    autocmd!
"    autocmd FileType apl        let b:repl_config = { 'cmd': 'apl' }
"    autocmd FileType sh         let b:repl_config = { 'cmd': 'dash' }
"    autocmd FileType python     let b:repl_config = { 'cmd': 'python' }
    autocmd FileType scheme     let b:repl_config = { 'cmd': 'racket' }
    autocmd FileType racket     let b:repl_config = { 'cmd': 'racket' }
"    autocmd FileType fennel     let b:repl_config = { 'cmd': 'fennel' }
"    autocmd FileType math       let b:repl_config = { 'cmd': 'qalc' }
"    autocmd FileType javascript let b:repl_config = { 'cmd': 'node' }
augroup END
" 2}}} "zepl
" tpipeline {{{ "2
" 	tpipeline comes bundled with its own custom minimal statusline seen above
" 	set laststatus=0 "show statusbar
" 	let g:tpipeline_cursormoved = 1
" 	let g:tpipeline_statusline = '%!Statusline_expr()'
" 	hi StatusLine ctermbg=NONE ctermfg=232 guibg=NONE guifg=#B3B8C4
" 2}}} "tpipeline
]]
