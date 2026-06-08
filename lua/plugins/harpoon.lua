return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
		},
		{
			"<leader>A",
			function()
				require("harpoon"):list():prepend()
			end,
		},
		{
			"<C-e>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Open harpoon",
		},

		{
			"<M-1>",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<M-2>",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<M-3>",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<M-4>",
			function()
				require("harpoon"):list():select(4)
			end,
		},
	},
	-- config = function()
	-- 	local harpoon = require("harpoon")
	--
	-- 	harpoon:setup()
	--
	-- 	vim.keymap.set("n", "<leader>a", function()
	-- 		harpoon:list():add()
	-- 	end)
	-- 	vim.keymap.set("n", "<leader>A", function()
	-- 		harpoon:list():prepend()
	-- 	end)
	-- 	vim.keymap.set("n", "<C-e>", function()
	-- 		harpoon.ui:toggle_quick_menu(harpoon:list())
	-- 	end, { desc = "Open harpoon window" })
	--
	-- 	vim.keymap.set("n", "<M-1>", function()
	-- 		harpoon:list():select(1)
	-- 	end)
	-- 	vim.keymap.set("n", "<M-2>", function()
	-- 		harpoon:list():select(2)
	-- 	end)
	-- 	vim.keymap.set("n", "<M-3>", function()
	-- 		harpoon:list():select(3)
	-- 	end)
	-- 	vim.keymap.set("n", "<M-4>", function()
	-- 		harpoon:list():select(4)
	-- 	end)
	-- end,
}
