require 'meliora'.setup({
    dim_inactive = true,
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
        operators = 'bold',
    },
    plugins = {
        cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = true,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
    }
})

vim.o.termguicolors = true
vim.cmd [[colorscheme meliora]]
