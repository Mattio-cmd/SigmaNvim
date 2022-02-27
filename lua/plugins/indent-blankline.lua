--== red yellow green cyan blue magenta ==--
--vim.opt.termguicolors = true
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#fb4934 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#fabd2f gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#b8bb26 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#458588 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#83a598 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#b16286 gui=nocombine]]

  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "Dashboard" }
  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  }

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    --char_highlight_list = {
        --"IndentBlanklineIndent1",
        --"IndentBlanklineIndent2",
        --"IndentBlanklineIndent3",
        --"IndentBlanklineIndent4",
        --"IndentBlanklineIndent5",
        --"IndentBlanklineIndent6",
    --},
}
