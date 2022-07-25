require 'meliora'.setup({
    dim_inactive = false,
    neutral = true, -- set this to `true` for neutral background and greys.
    styles = {
        comments = 'italic',
        conditionals = 'NONE',
        folds = 'NONE',
        loops = 'NONE',
        functions = 'italic',
        keywords = 'NONE',
        strings = 'NONE',
        variables = 'NONE',
        numbers = 'NONE',
        booleans = 'NONE',
        properties = 'NONE',
        types = 'NONE',
        operators = 'NONE',
    },
    plugins = {
        cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
    }
})

vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[
	set background=dark
	let g:gruvbox_material_background='hard'
	let g:gruvbox_material_transparent_background = 1
]]
vim.cmd [[colorscheme meliora]]

