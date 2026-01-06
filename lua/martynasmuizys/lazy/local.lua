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
		"rxze49",
		dir = "~/personal/dev/rxze49/",
		config = function()
			require("rxze49").setup({
				enable = {
					terminal = true,
				},
				styles = {
					transparency = true,
				},
			})
		end,
	},
}
