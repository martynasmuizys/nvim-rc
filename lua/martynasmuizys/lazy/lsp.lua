return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "saghen/blink.cmp", version = "1.*" },
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		local blink = require("blink.cmp")
		local capabilities =
			vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities())

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
				"clangd",
			},
		})

		vim.lsp.config("clangd", {
			capabilities = capabilities,
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

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "it", "describe", "before_each", "after_each" },
					},
				},
			},
		})

		blink.setup({

			keymap = {
				preset = "none",

				["<Tab>"] = { "accept", "fallback" },
				["<C-p>"] = { "select_prev", "snippet_backward" },
				["<C-n>"] = { "select_next", "snippet_forward" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				list = {
					selection = {
						auto_insert = false,
					},
				},
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind" },
						},
					},
				},
				documentation = {
					window = {
						border = "rounded",
					},
					auto_show = false,
				},
			},

			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},

			snippets = {
				preset = "luasnip",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			virtual_text = {
				enabled = true,
				severity = "Error",
				prefix = "●",
			},
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
		vim.keymap.set("n", "<leader>h", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
		end)
	end,
}
