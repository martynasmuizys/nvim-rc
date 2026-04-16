_G.lazy_load(nil, {
	"sirzif/tzfn.nvim",
	config = function()
		require("tzfn").setup({
			enable = {
				terminal = true,
			},
			styles = {
				transparency = true,
			},
		})

		vim.cmd.colorscheme("tzfn")
	end,
})
