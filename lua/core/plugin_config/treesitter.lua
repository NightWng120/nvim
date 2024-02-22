require'nvim-treesitter.configs'.setup {
	-- A list of parser namse, or "all"
	ensure_installed = { "c", "cpp", "python", "javascript", "lua", "rust", "markdown", "markdown_inline", "r"},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
	},
}
