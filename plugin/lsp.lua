vim.schedule(function()
	vim.pack.add({
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
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

	local blink = require("blink.cmp")
	local capabilities =
		vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities())

	vim.lsp.config("*", {
		capabilities = capabilities,
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
				auto_show = true,
			},

			keyword = { range = "full" },
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
end)
