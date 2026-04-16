require("settings")
require("keymaps")
require("autocmd")

vim.cmd("packadd nvim.undotree")

local loaded_deps = {}

local autocmd = vim.api.nvim_create_autocmd

-- why am i doing this even???
local function install(p)
	vim.pack.add({
		{ src = "https://github.com/" .. p[1], version = p.version and vim.version.range(p.version) or nil },
	})

	if p.dependencies ~= nil then
		for _, d in pairs(p.dependencies) do
			local name
			local version = nil
			if type(d) == "string" then
				name = d
			end
			if type(d) == "table" then
				name = d[1]
				-- def not good
				version = d.version and vim.version.range(d.version) or nil
			end

			if not loaded_deps[name] then
				vim.pack.add({ { src = "https://github.com/" .. name, version = version } })
				loaded_deps[name] = true
			end
		end
	end
	vim.schedule(p.config)
end

function _G.lazy_load(event, plugin)
	if event ~= nil then
		autocmd(event, {
			once = true,
			callback = function()
				install(plugin)
			end,
		})
	else
		install(plugin)
	end
end
