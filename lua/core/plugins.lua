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
	    tag = '0.1.0',
	    requires = {{'nvim-lua/plenary.nvim'}}
	}
	use 'lervag/vimtex'
	use 'tpope/vim-obsession'
	-- use {
	--   'VonHeikemen/lsp-zero.nvim',
	--   branch = 'v2.x',
	--   requires = {
	--     -- LSP Support
	--     {'neovim/nvim-lspconfig'},             -- Required
	--     {                                      -- Optional
	--       'williamboman/mason.nvim',
	--       run = function()
	--         pcall(vim.cmd, 'MasonUpdate')
	--       end,
	--     },
	--     {'williamboman/mason-lspconfig.nvim'}, -- Optional
	--     -- Autocompletion
	--     {'hrsh7th/nvim-cmp'},     -- Required
	--     {'hrsh7th/cmp-nvim-lsp'}, -- Required
	--     {'L3MON4D3/LuaSnip'},     -- Required
	--   }
	-- }
	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
	  require('packer').sync()
	end
end)
