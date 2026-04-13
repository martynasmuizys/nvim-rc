vim.pack.add({ "https://github.com/sirzif/tzfn.nvim" })

require("tzfn").setup({
	enable = {
		terminal = true,
	},
	styles = {
		transparency = true,
	},
})

vim.cmd.colorscheme("tzfn")
