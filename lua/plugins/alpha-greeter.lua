local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function footer()
	local datetime = os.date("%I:%M:%p | %d-%m-%Y")
	return datetime
end

dashboard.section.footer.val = footer()
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

dashboard.section.header.val = {
    ':::::::::::::::::::::::::: ',
    ':::::::::::::::::::::::::: ',
    '  ::::::              :::: ',
    '    ::::::              :: ',
    '      ::::::               ',
    '       ::::::              ',
    '      ::::::               ',
    '    ::::::              :: ',
    '  :::::::             :::: ',
    ':::::::::::::::::::::::::: ',
    ':::::::::::::::::::::::::: ',
}

dashboard.section.buttons.val = {
	dashboard.button("e", "洛 > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  --dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
	--dashboard.button("t", "  > Find text", ":Telescope live_grep <CR>"),
	--dashboard.button("m", "  > Bookmarks", ":Telescope marks<CR>"),
	dashboard.button("s", "  > Settings", ":e ~/.config/nvim/ <CR>"),
	dashboard.button("u", "  > Update Plugins", ":PackerSync <CR>"),
}
