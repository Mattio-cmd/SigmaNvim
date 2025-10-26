return {

	'lewis6991/impatient.nvim', -- Speed up loading Lua modules in Neovim to improve startup time.

   'preservim/nerdcommenter',

   'windwp/nvim-autopairs',

   'lukas-reineke/indent-blankline.nvim',

   'norcalli/nvim-colorizer.lua',

   'neovim/nvim-lspconfig',

   'hrsh7th/cmp-nvim-lsp',

   'hrsh7th/nvim-cmp',

   'onsails/lspkind-nvim',

   'nvimdev/lspsaga.nvim',

    'saadparwaiz1/cmp_luasnip',

    'KeitaNakamura/tex-conceal.vim',

    'lervag/vimtex',

    'kyazdani42/nvim-tree.lua',


   -- colorscheme
  {
      'rebelot/kanagawa.nvim',
      priority = 1000,
  },

  -- lualine
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
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

--  { -- TODO: Configure this
 --   'michaelb/sniprun',
  --  run = 'bash ./install.sh',
  --},


  {
     'akinsho/bufferline.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  -- treesitter
  {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
  },

  --{ -- Symbols outline
    --'simrat39/symbols-outline.nvim',
  --},

  {
    'L3MON4D3/LuaSnip', -- Remove if it fucks everything up
  	run = "make install_jsregexp",
    event = "InsertEnter",
    config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  },

}
