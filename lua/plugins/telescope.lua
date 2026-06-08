return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader>pf",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		{
			"<C-p>",
			function()
				require("telescope.builtin").git_files()
			end,
		},
		{
			"<leader>ps",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			end,
		},
		{
			"<leader>vh",
			function()
				require("telescope.builtin").help_tags()
			end,
		},
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_cursor({}),
				},
			},
			pickers = {
				find_files = {
					-- hidden = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
						"--glob",
						"!**node_modules/*",
					},
				},
			},
		})
		require("telescope").load_extension("ui-select")

		-- local builtin = require("telescope.builtin")
		-- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		-- vim.keymap.set("n", "<leader>pws", function()
		-- 	local word = vim.fn.expand("<cword>")
		-- 	builtin.grep_string({ search = word })
		-- end)
		-- vim.keymap.set("n", "<leader>pWs", function()
		-- 	local word = vim.fn.expand("<cWORD>")
		-- 	builtin.grep_string({ search = word })
		-- end)
		-- vim.keymap.set("n", "<leader>ps", function()
		-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
		-- end)
		-- vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
}
