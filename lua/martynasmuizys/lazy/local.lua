return {
	{
		"horizn",
		dir = "~/personal/dev/horizn_v2/",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("horizn").setup({})
		end,
	},
	{
		"rxze49",
		dir = "~/personal/dev/rxze49-nvimv2/",
		config = function()
			require("rxze49").setup({
				variant = "main",
				enable = {
					terminal = true,
				},
				styles = {
					italic = false,
					transparency = true,
				},
			})
		end,
	},
}
