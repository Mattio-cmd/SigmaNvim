
local use = require('packer').use
require('packer').startup(function()
-- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use 'sainnhe/gruvbox-material'
  -- nerdcomenter
  use 'preservim/nerdcommenter'
  -- lualine
  use 'nvim-lualine/lualine.nvim'
  -- devicons
  use 'kyazdani42/nvim-web-devicons'
  -- nvim-tree
  use 'kyazdani42/nvim-tree.lua'
  --fzf 
  use 'vijaymarupudi/nvim-fzf'
  -- dashboard
  use 'glepnir/dashboard-nvim'
  -- treesitter
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

end)
