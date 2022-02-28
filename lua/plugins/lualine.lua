-- For lualine
local function date_time()
	local datetime = os.date("%I:%M:%p")
	return datetime
end


-- let g:airline_left_sep =  '' "'
-- let g:airline_left_alt_sep =  '' "''

require'lualine'.setup{
options = {
    icons_enabled = true,
    theme = 'kanagawa',
    --theme = 'gruvbox-material',
    --component_separators = { left = '', right = ''},
    --section_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},  --  
    component_separators = { left = '', right = ''},
    --section_separators = { left = '', right = ''},  --  
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  local_icons = {
    vim               = '',
    git               = '',
    github            = '',
    gitlab            = '',
    gitbitbucket      = '',
    hg                = '',
    gitadd            = ' ',
    gitmod            = ' ',
    gitdel            = ' ',
    -- gitdel         = ' ',
    -- lsp               = '',
    lsp               = '',
    lspdiagerror      = ' ',
    -- lspdiagerror   = ' ',
    lspdiagwarning    = ' ',
    -- lspdiagwarning = ' ',
    lspdiaginfo       = ' ',
    -- lspdiaginfo    = ' ',
    lspdiaghint       = ' ',
    -- lspdiaghint    = ' ',
    dos               = '',
    unix              = '',
    -- unix           = '',
    mac               = '',
    typewriteable     = '',
    -- typewriteable  = '',
    -- typewriteable  = '',
    typereadonly      = '',
    typesize          = '',
    -- typesize       = '',
    typeenc           = '',
    stats             = '⅑',
    -- statsvert      = '⇳',
    statsvert         = '⬍',
    -- statshoriz     = '⇔',
    statshoriz        = '⬌',
    statsspace        = '⯀',
    statstab          = '⯈',
},
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_w = { date_time() },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
  lualine_a = {'tabs'},
  lualine_b = {},
  lualine_c = {'buffers'},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
          },
  lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
  extensions = {}
}
