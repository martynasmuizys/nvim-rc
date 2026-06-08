return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			-- notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				go = { "gofmt" },
				-- javascript = { "prettier" },
				-- typescript = { "prettier" },
				-- sh = { "beautysh" },
				-- bash = { "beautysh" },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = {
						"--style=file",
						"--fallback-style=LLVM",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
