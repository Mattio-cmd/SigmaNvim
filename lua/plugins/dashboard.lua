vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = {
	        '  ███╗   ██╗██╗   ██╗██╗███╗   ███╗' ,
       	  '  ████╗  ██║██║   ██║██║████╗ ████║' ,
        	'  ██╔██╗ ██║██║   ██║██║██╔████╔██║' ,
			    '  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║' ,
			    '  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║' ,
			    '  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ' ,
		      }
vim.g.dashboard_custom_footer = {
    "Loaded 13 plugins"
}


vim.g.dashboard_custom_section = {
   a = { description = { "        Find File                 " }, command = "Telescope find_files" },
   b = { description = { "        Recents                   " }, command = "Telescope oldfiles" },
   c = { description = { "        Find Word                 " }, command = "Telescope live_grep" },
   d = { description = { "      洛 New File                  " }, command = "DashboardNewFile" },
   e = { description = { "        Bookmarks                 " }, command = "Telescope marks" },
   f = { description = { "        Load Last Session         " }, command = "SessionLoad" },
}

