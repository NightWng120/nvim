require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "jdtls","tsserver", "rust_analyzer", "pyright", "asm_lsp", "r_language_server", "typos_lsp" }
})
--(Optional) Configure lua language server for neovim

--require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local on_attach = function(_, _)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>co', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'},
			},
		},
	}
}

require('lspconfig').typos_lsp.setup{
	on_attach = function(client, _)
		-- Disabled for Markdown, use LaTeX instead
		local disabled_filetypes = vim.iter({ 'markdown', 'NvimTree' })
		if disabled_filetypes:find(vim.bo.filetype) ~= nil then
			-- Force-shutdown seems to be necessary for some reason
			vim.lsp.stop_client(client.id, true)
		end
	end,
	init_options = {
		diagnosticSeverity = 'hint',
		-- Fixes issue where config is ignored when opening a file with
		-- Telescope from some other directory
		config = vim.env.HOME .. '/.typos.toml',
	},

	capabilities = capabilities
}

-- Enable debug logs for the LSP client. Recommended for debugging only.
vim.lsp.set_log_level("debug")
require("lspconfig").clangd.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").jdtls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").tsserver.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").rust_analyzer.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").pyright.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").r_language_server.setup{
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").asm_lsp.setup{
	on_attach = on_attach,
	capabilities = capabilities,
    root_dir = function(fname)
        return vim.loop.cwd()
    end,
}









--********* LSP ZERO CONFIG **********************
--local lsp = require('lsp-zero').preset("recommended")
--
--lsp.ensure_installed({
--	"lua_ls",
--	"clangd",
--	"jdtls",
--	"java_language_server"
--})
--
--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true}),
--	['<C-Space>'] = cmp.mapping.complete(),
--})
--
--lsp.setup_nvim_cmp({
--	mapping = cmp_mappings
--})
--
--lsp.on_attach(function(client, bufnr)
--	local opts = {buffer = bufnr, rempap = false}
--
----	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
----	vim.keymap.set('n', '<leader>co', vim.lsp.buf.code_action, {})
--
--	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--	vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
--	vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
--	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
--	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
--	vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
--	vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
--	vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
--	vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
--
--	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--	vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
--
--end)
--lsp.setup()
