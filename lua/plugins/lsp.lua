return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

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

		vim.lsp.config("zls", {
			settings = {
				zls = {
					enable_inlay_hints = true,
					enable_snippets = true,
					warn_style = true,
				},
			},
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
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

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local luasnip = require("luasnip")

		cmp.setup({
			enabled = function()
				local disabled = false
				disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
				disabled = disabled or (vim.bo.filetype == "oil")
				disabled = disabled or (vim.fn.reg_recording() ~= "")
				disabled = disabled or (vim.fn.reg_executing() ~= "")
				disabled = disabled or require("cmp.config.context").in_treesitter_capture("comment")
				return not disabled
			end,

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			mapping = cmp.mapping.preset.insert({

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expandable() then
						luasnip.expand()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item(cmp_select)
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-p>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item(cmp_select)
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				["<C-Space>"] = cmp.mapping.complete(),

				["<C-e>"] = cmp.mapping.close(),
				["<C-k>"] = cmp.mapping(function(fallback)
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					if next(clients) ~= nil then
						vim.lsp.buf.signature_help()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			window = {
				completion = cmp.config.window.bordered({ border = "rounded" }),
				documentation = cmp.config.window.bordered({ border = "rounded" }),
			},

			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text", -- show both icon and text
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},

			completion = {
				keyword_length = 2,
				max_item_count = 12,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
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
	end,
}
