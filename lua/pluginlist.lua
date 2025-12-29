return {

	'lewis6991/impatient.nvim', -- Speed up loading Lua modules in Neovim to improve startup time.

  -- treesitter
  {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
  },

  {
    'L3MON4D3/LuaSnip', -- Remove if it fucks everything up
  	run = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  },

}
