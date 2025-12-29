return {
	"horizn",
	dir = "~/dev/horizn_v2/",
	dependencies = { "nvim-tree/nvim-web-devicons", "tpope/vim-fugitive" },
	config = function()
		require("horizn").setup({})
	end,
}
