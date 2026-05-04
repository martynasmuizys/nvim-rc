_G.lazy_load(nil, {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local parsers = {
			"vimdoc",
			"javascript",
			"typescript",
			"c",
			"lua",
			"rust",
			"jsdoc",
			"bash",
			"go",
			"zig",
		}

		local group = vim.api.nvim_create_augroup("TreesitterGroup", { clear = true })
		--
		-- vim.api.nvim_create_autocmd("User", {
		-- 	group = group,
		-- 	pattern = "VeryLazy",
		-- 	once = true,
		-- 	callback = function()
		-- 		require("nvim-treesitter").install(parsers)
		-- 	end,
		-- })
		vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
			group = group,
			callback = function()
				if vim.bo.buftype ~= "" then
					return
				end

				pcall(vim.treesitter.start, 0)
			end,
		})
		require("nvim-treesitter").install(parsers)

		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
				},
			},
		})
	end,
})
