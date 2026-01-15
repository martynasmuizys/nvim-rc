return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
		function _G.get_oil_winbar()
			local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
			local dir = require("oil").get_current_dir(bufnr)
			if dir then
				return vim.fn.fnamemodify(dir, ":~")
			else
				-- If there is no current directory (e.g. over ssh), just show the buffer name
				return vim.api.nvim_buf_get_name(0)
			end
		end
		require("oil").setup({
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
			confirmation = {
				border = "rounded",
			},
		})
		-- Open parent directory in current window
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

		-- Open parent directory in floating window
		vim.keymap.set("n", "<space>-", require("oil").toggle_float)
	end,
}
