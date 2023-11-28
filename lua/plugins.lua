local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
 -- Packer can manage itself
  use 'wbthomason/packer.nvim' --

 -- Improve Start-UP time
	use { -- Speed up loading Lua modules in Neovim to improve startup time.
		'lewis6991/impatient.nvim' --
	}


  -- nerdcomenter
  use {
    'preservim/nerdcommenter'
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
  }


  -- devicons
  use {
    'kyazdani42/nvim-web-devicons'
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua'
  }

  -- telescope
  use {
       'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- autopairs
  use {
    'windwp/nvim-autopairs',
  }

  use({ -- Preview for markdown files
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })


  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

-- debugger
  use {
    'mfussenegger/nvim-dap',
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
  }

  use { -- TODO: Configure this
    'michaelb/sniprun',
    run = 'bash ./install.sh',
  }


  use {
     'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
  }

  -- treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
  }

  use {
        'norcalli/nvim-colorizer.lua'
  }

  use {
        'neovim/nvim-lspconfig'
  }

  use {
        'hrsh7th/cmp-nvim-lsp'
  }

  use {
  'hrsh7th/nvim-cmp',
  }

  use {
        'nvim-lua/completion-nvim'
  }
  use {
        'onsails/lspkind-nvim'
  }
  use {
        'tami5/lspsaga.nvim'
  }



  -- kanagawa (colorscheme)
  use {
    'rebelot/kanagawa.nvim'
  }


use {
    'simrat39/symbols-outline.nvim',
    require("symbols-outline").setup(),
  }


  use {
    'elkowar/yuck.vim'
  }

  use {
    'lervag/vimtex'
  }

  use {
    'L3MON4D3/LuaSnip',
    	-- follow latest release.
    --tag = "v2.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  	-- install jsregexp (optional!:).
  	run = "make install_jsregexp"
  }
  use {
    'saadparwaiz1/cmp_luasnip'
  }

  use {
    'KeitaNakamura/tex-conceal.vim'
  }

  --== Plugins im not currently using ==--

--use({
  --"folke/noice.nvim",
  --event = "VimEnter",
  --config = function()
  --require("noice").setup()
  --end,
  --requires = {
  ---- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --"MunifTanjim/nui.nvim",
  --"rcarriga/nvim-notify",
  --"hrsh7th/nvim-cmp",
  --}
--})

  -- colorscheme
  --use {
  --'sainnhe/gruvbox-material'
  --}

  --use {
    --'shaunsingh/oxocarbon.nvim', run = './install.sh'
  --}

  --use({
    --'ramojus/mellifluous.nvim',
    --requires = { 'rktjmp/lush.nvim' },
  --})

  --presence.nvim
  --use {
    --'andweeb/presence.nvim'
  --}

  --use { -- For dart development
    --'dart-lang/dart-vim-plugin'
  --}

  --use {
    --'akinsho/flutter-tools.nvim'
  --}



  --use {
    --'axvr/zepl.vim'
  --}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
