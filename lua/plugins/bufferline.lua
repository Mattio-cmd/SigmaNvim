require('bufferline').setup {
	options = {
		numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
		always_show_bufferline = false, -- don't show bufferline if there is only one file is opened

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
		separator_style = {"slant", "slant"}, -- options "slant" | "thick" | "thin" | { 'any', 'any' },
		offsets = {
			-- options function , text_" "h always_show_bufferline = false
			{filetype = "NvimTree", text = "Explorer", text_align = "left"},
		},
	},

	highlights = {
		fill = {guibg = {highlight = "BufferLineFill", attribute = "bg"}},
		background = { -- current tab
			guifg = {highlight = "BufferCurrent", attribute = "fg"},
			guibg = {highlight = "BufferCurrent", attribute = "bg"},
		},
		separator = {guifg = {highlight = "BufferSeparator", attribute = "fg"}},
		separator_selected = {
			guifg = {highlight = "BufferSeparatorSelected", attribute = "fg"},
		},
		close_button_selected = {
			guifg = {highlight = "BufferCloseButtonSelected", attribute = "fg"},
			guibg = {highlight = "BufferCloseButtonSelected", attribute = "bg"},
		},
		duplicate = {
			guifg = {highlight = "BufferCurrentSign", attribute = "fg"},
			guibg = {highlight = "BufferLineFill", attribute = "bg"},
		},
		duplicate_selected = {
			guifg = {highlight = "BufferCurrentSign", attribute = "fg"},
		},
		modified = {
			guifg = {highlight = "BufferCurrentSign", attribute = "fg"},
			guibg = {highlight = "BufferLineFill", attribute = "bg"},
		},
		modified_selected = {
			guifg = {highlight = "BufferCurrentSign", attribute = "fg"},
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
