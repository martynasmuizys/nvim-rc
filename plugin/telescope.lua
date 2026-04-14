vim.schedule(function()
	vim.pack.add({
		{ src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("0.2.*") },
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/nvim-telescope/telescope-ui-select.nvim",
		-- need a build hook
		-- { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	})

	require("telescope").load_extension("ui-select")
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
				layout_config = {
					preview_width = 0.5,
				},
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
end)
