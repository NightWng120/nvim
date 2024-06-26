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
	use 'ellisonleao/gruvbox.nvim'
	use 'tomasr/molokai'
	use 'wbthomason/packer.nvim'
	use 'mattn/emmet-vim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'mfussenegger/nvim-jdtls'
	use{
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig"
	}
	use 'rafamadriz/friendly-snippets'
	use 'matveyt/neoclip'
	use {
		'christoomey/vim-tmux-navigator',
	  lazy = false
	}
	use{
	    'nvim-telescope/telescope.nvim',
	    tag = '0.1.8',
	    requires = {{'nvim-lua/plenary.nvim'}}
	}
	use 'lervag/vimtex'
	use 'tpope/vim-obsession'
	if packer_bootstrap then
	  require('packer').sync()
	end
end)
