local status, bufferline = pcall(require, "bufferline")
if not status then
  print("ERROR bufferline")
  return
end

bufferline.setup({
  options = {
 		numbers = "ordinal", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string
		always_show_bufferline = false, -- don't show bufferline if there is only one file is opened

		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator_icon = '▎>',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',

		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicate
		tab_size = 18,

		show_close_icon = false,
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_tab_indicators = true,

		separator_style = {"|", "|"}, -- options "slant" | "thick" | "thin" | { 'any', 'any' },
		offsets = {
			-- options function , text_" "h always_show_bufferline = false
			{filetype = "NvimTree", text = "Explorer", text_align = "left"},
		},
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
	},
})
