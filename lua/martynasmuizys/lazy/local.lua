return {
	{
		"horizn",
		dir = "~/personal/dev/horizn/",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("horizn").setup({})
		end,
	},
	{
		"tzfn",
		dir = "~/personal/dev/tzfn/",
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
	},
}
