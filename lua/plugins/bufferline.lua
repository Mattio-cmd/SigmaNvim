require('bufferline').setup {
	options = {
		numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
		always_show_bufferline = true, -- don't show bufferline if there is only one file is opened

		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',

		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.

		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicate
		tab_size = 18,

		show_close_icon = false,
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_tab_indicators = false,

		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = {"", ""}, -- options "slant" | "thick" | "thin" | { 'any', 'any' },
		offsets = {
			-- options function , text_" "h always_show_bufferline = false
			{filetype = "NvimTree", text = "Explorer", text_align = "left"},
		},
      --custom_areas = {
      --right = function()
         --return {
            --{ text = "%@Toggle_theme@" .. vim.g.toggle_theme_icon .. "%X" },
            --{ text = "%@Quit_vim@  %X" },
         --}
      --end,
   --},
	},

	highlights = {
		fill = {bg = {highlight = "BufferLineFill", attribute = "bg"}},
		background = { -- current tab
			fg = {highlight = "BufferCurrent", attribute = "fg"},
			bg = {highlight = "BufferCurrent", attribute = "bg"},
		},
		separator = {fg = {highlight = "BufferSeparator", attribute = "fg"}},
		separator_selected = {
			fg = {highlight = "BufferSeparatorSelected", attribute = "fg"},
		},
		close_button_selected = {
			fg = {highlight = "BufferCloseButtonSelected", attribute = "fg"},
			bg = {highlight = "BufferCloseButtonSelected", attribute = "bg"},
		},
		duplicate = {
			fg = {highlight = "BufferCurrentSign", attribute = "fg"},
			bg = {highlight = "BufferLineFill", attribute = "bg"},
		},
		duplicate_selected = {
			fg = {highlight = "BufferCurrentSign", attribute = "fg"},
		},
		modified = {
			fg = {highlight = "BufferCurrentSign", attribute = "fg"},
			bg = {highlight = "BufferLineFill", attribute = "bg"},
		},
		modified_selected = {
			fg = {highlight = "BufferCurrentSign", attribute = "fg"},
		},
		-- duplicate_visible = {
		-- },
		-- close_button = {
		-- },
		-- close_button_visible = {
		-- },
		-- tab_selected = {
		-- },
		-- buffer_visible = {
		-- },
		-- buffer_selected = {
		-- },
		-- modified_visible = {
		-- },
		-- separator_visible = {
		-- },
		-- indicator_selected = {
		-- },
	},

}
