return {
	"horizn",
	dir = "~/personal/horizn/",
	dependencies = { "nvim-tree/nvim-web-devicons", "tpope/vim-fugitive" },
	config = function()
		require("horizn").setup({})
	end,
}
