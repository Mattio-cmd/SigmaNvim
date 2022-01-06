local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
 -- Packer can manage itself
  use 'wbthomason/packer.nvim'
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
    config = function()
      require('mattio.lualine')
    end
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
  -- dashboard
  use {
    'glepnir/dashboard-nvim'
    }
  -- autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('mattio.autopairs')
    end
    }
  use {
     'L3MON4D3/LuaSnip'
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
        'hrsh7th/nvim-cmp'
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
  --== Plugins im not currently using ==--
  -- kanagawa (colorscheme)
  --use {
    --'rebelot/kanagawa.nvim'
  --}
  ---- filetype
  --use { --  Easily speed up your neovim startup time!. A faster version of filetype.vim
    --'nathom/filetype.nvim',
  --}
  --use { --Preview for markdown files
  --'iamcco/markdown-preview.nvim',
  --}

  if packer_bootstrap then
    require('packer').sync()
  end
end)


