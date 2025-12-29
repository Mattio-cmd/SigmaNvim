return {

	'lewis6991/impatient.nvim', -- Speed up loading Lua modules in Neovim to improve startup time.

  'neovim/nvim-lspconfig',

  'hrsh7th/cmp-nvim-lsp',

  'hrsh7th/nvim-cmp',

  'onsails/lspkind-nvim',

  'preservim/nerdcommenter',

  'windwp/nvim-autopairs',

  'norcalli/nvim-colorizer.lua',

  'kyazdani42/nvim-tree.lua',

  'KeitaNakamura/tex-conceal.vim',



  {
    'L3MON4D3/LuaSnip', -- Remove if it fucks everything up
    run = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
  },

  -- treesitter
  {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Greeter
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },

  {
     'akinsho/bufferline.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
  },


}
