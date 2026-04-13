-- vim.schedule(function()
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	notify_on_error = false,
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 5000,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		sh = { "beautysh" },
		bash = { "beautysh" },
		markdown = { "oxfmt" },
		yaml = { "oxfmt" },
	},
	formatters = {},
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ bufnr = 0 })
end)
-- end)
