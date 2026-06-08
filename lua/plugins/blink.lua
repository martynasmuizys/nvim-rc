return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
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
		-- snippets = {
		-- 	preset = "luasnip",
		-- },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
