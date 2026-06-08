return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		-- "williamboman/mason-lspconfig.nvim",
		-- "j-hui/fidget.nvim",
	},
	config = function()
		-- require("fidget").setup({})
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})

		-- require("mason-lspconfig").setup({
		-- 	ensure_installed = {
		-- 		"lua_ls",
		-- 		"gopls",
		-- 		"clangd",
		-- 		"zls",
		-- 	},
		-- })

		vim.lsp.config("qmlls", {})

		vim.lsp.config("clangd", {
			init_options = {
				fallbackFlags = {
					"--std=c++26",
				},
			},
			cmd = {
				"clangd",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
		})

		vim.lsp.config("zls", {
			settings = {
				zls = {
					enable_inlay_hints = true,
					warn_style = true,
					enable_argument_placeholders = false,
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					format = {
						enable = true,
						-- Put format options here
						-- NOTE: the value should be STRING!!
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
				},
			},
		})

		vim.lsp.enable({ "lua_ls", "clangd", "zls", "gopls", "qmlls" })

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
	end,
}
