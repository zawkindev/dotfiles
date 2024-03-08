

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "rebelot/kanagawa.nvim"
  use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {'bluz71/vim-moonfly-colors', as = 'moonfly'}
  use { "zootedb0t/citruszest.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use 'sainnhe/gruvbox-material'
  use {
    'crispgm/nvim-tabline',
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    {
	    "L3MON4D3/LuaSnip",
	    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	    run = "make install_jsregexp"
    }
  }
  use {
  'nvim-tree/nvim-tree.lua',
  }
  use 'nvim-tree/nvim-web-devicons'



 if packer_bootstrap then
    require('packer').sync()
  end
end)
