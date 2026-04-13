-- vim.schedule(function()
vim.pack.add({
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/hrsh7th/cmp-cmdline",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/onsails/lspkind.nvim",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
})
-- end)

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

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
		-- keyword_length = 2,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 12 },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "path", max_item_count = 12 },
	}, {
		{ name = "buffer" },
	}),
})
