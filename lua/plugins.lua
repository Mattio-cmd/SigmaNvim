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

	use { -- Easily speed up your neovim startup time!. A faster version of filetype.vim
		'nathom/filetype.nvim'
  	}
   -- colorscheme
  use {
    'sainnhe/gruvbox-material'
    }
    -- nerdcomenter
  use {
    'preservim/nerdcommenter'
  }
  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
  }

  -- presence.nvim
  use {
    'andweeb/presence.nvim'
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

  use { --Preview for markdown files
    'davinche/godown-vim',
  }
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
  }

  use {
     'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
  }

  -- treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
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
    'simrat39/symbols-outline.nvim',
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
  use {
    'dart-lang/dart-vim-plugin'
  }

  use {
    'akinsho/flutter-tools.nvim'
  }

  -- Debugger
  use {
    'mfussenegger/nvim-dap',
    requires='mfussenegger/nvim-dap-python',
    require('dap-python').setup('$HOME/.virtualenvs/debugpy/bin/python'),
  }

  -- kanagawa (colorscheme)
  use {
    'rebelot/kanagawa.nvim'
  }

  --== Plugins im not currently using ==--

  --use {
    --'L3MON4D3/LuaSnip'
  --}

  --use {
    --'elkowar/yuck.vim'
  --}

  --use {
    --'axvr/zepl.vim'
  --}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
