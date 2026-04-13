vim.api.nvim_create_autocmd("BufReadPre", {
	once = true,
	pattern = ".env*",
	callback = function()
		vim.pack.add({ "https://github.com/laytan/cloak.nvim" })
		require("cloak").setup({})
	end,
})
