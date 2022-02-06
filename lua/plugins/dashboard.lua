vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = {
	                    ' ███╗   ██╗██╗   ██╗██╗███╗   ███╗' ,
       			    ' ████╗  ██║██║   ██║██║████╗ ████║' ,
        		    ' ██╔██╗ ██║██║   ██║██║██╔████╔██║' ,
			    ' ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║' ,
			    ' ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║' ,
			    ' ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ by Mattio-cmd ' ,
		      }
vim.g.dashboard_custom_footer = {
    " ",
    "Enjoy neovim :D"
}


vim.g.dashboard_custom_section = {
   a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
   b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
   d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
   e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
   f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
}

