function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)
end

return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					StatusLine = { fg = "subtle", bg = "surface" },
					StatusLineNC = { fg = "muted", bg = "surface", blend = 60 },
					-- Normal = { bg = "none" },
					-- NormalNC = { bg = "none" },
					-- TelescopeBorder = { fg = "highlight_high", bg = "base" },
					-- TelescopeNormal = { bg = "base" },
					-- TelescopePromptNormal = { bg = "base" },
					-- TelescopeResultsNormal = { fg = "subtle", bg = "base" },
					-- TelescopeSelection = { fg = "text", bg = "base" },
					-- TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				},
			})

			ColorMyPencils()
		end,
	},
}
