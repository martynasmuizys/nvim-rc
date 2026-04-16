_G.lazy_load({ "BufReadPre", "BufNewFile" }, {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup()
	end,
})
