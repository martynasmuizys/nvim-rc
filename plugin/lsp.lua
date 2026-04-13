vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/j-hui/fidget.nvim",
})

require("fidget").setup({})
require("mason").setup({
	ui = {
		border = "rounded",
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"zls",
	},
})

vim.diagnostic.config({
	-- update_in_insert = true,
	-- virtual_text = {
	-- 	enabled = true,
	-- 	severity = "Error",
	-- 	prefix = "●",
	-- },
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})
