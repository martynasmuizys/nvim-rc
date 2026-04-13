return {
	-- {
	-- 	"martynasmuizys/horizn.nvim",
	-- 	-- dir = "~/stuff/horizn.nvim/",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("horizn").setup()
	-- 	end,
	-- },
	{
		"martynasmuizys/tzfn.nvim",
		config = function()
			require("tzfn").setup({
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
