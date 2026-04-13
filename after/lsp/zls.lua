return {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		zls = {
			enable_inlay_hints = true,
			enable_snippets = true,
			warn_style = true,
		},
	},
}
