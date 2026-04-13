---@type vim.lsp.Config
return {
	-- capabilities = vim.tbl_deep_extend(
	-- 	"force",
	-- 	{},
	-- 	vim.lsp.protocol.make_client_capabilities(),
	-- 	cmp_lsp.default_capabilities()
	-- ),
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			-- slow
			-- workspace = {
			-- 	library = vim.api.nvim_get_runtime_file("", true),
			-- 	checkThirdParty = false,
			-- },
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
				},
			},
		},
	},
}
