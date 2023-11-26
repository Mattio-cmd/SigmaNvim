-- nvim-tree
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  --open_on_setup       = false,
  --ignore_ft_on_setup  = {},
  --auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  --update_to_buf_dir   = {
    --enable = true,
    --auto_open = true,
  --},
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },

  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },

  view = {
    width = 30,
    --height = 30,
    relativenumber = true,
    side = 'left',
  }
}
