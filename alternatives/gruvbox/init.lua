      	--███╗   ██╗██╗   ██╗██╗███╗   ███╗
        --████╗  ██║██║   ██║██║████╗ ████║
        --██╔██╗ ██║██║   ██║██║██╔████╔██║
        --██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
        --██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
        --╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ by Mattio-cmd

-- plugin config to improve start-up time.
-- it should be always on top on init.lua file
require('plugins/impatient_nvim') -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
require('plugins/filetype_nvim') -- Easily speed up your neovim startup time!
require("keymaps")
require("plugins")
require("settings")
require("autocmd")
require("plugins.nvim-tree")
require("plugins.gruvbox-material")
--require("plugins.kanagawa")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.autopairs")
require("plugins.lualine")
require("plugins.alpha-greeter")
require("plugins.bufferline")
require("plugins.cmp")
require("plugins.lspsaga")
require("plugins.lspconfig")
require("plugins.zepl")
require("plugins.zepl")
require("plugins.indent-blankline")
require("plugins.bufferline")
require("plugins.flutter-tools")
