require'nvim-treesitter.configs'.setup {
	-- A list of parser namse, or "all"
	ensure_installed = { "c", "cpp", "python", "javascript", "lua", "rust"},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
