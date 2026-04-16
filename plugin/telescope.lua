_G.lazy_load(nil, {
	"nvim-telescope/telescope.nvim",
	version = "0.2.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").load_extension("ui-select")
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_cursor({}),
				},
			},
		})

		local builtin = require("telescope.builtin")
		local keymap = vim.keymap

		keymap.set("n", "<leader>pf", builtin.find_files, {})
		keymap.set("n", "<C-p>", builtin.git_files, {})
		keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Search 󰍉 ") })
		end)
		keymap.set("n", "<leader>vh", builtin.help_tags, {})
	end,
})
