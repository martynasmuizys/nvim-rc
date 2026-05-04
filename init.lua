require("settings")
require("keymaps")
require("autocmd")

vim.cmd("packadd nvim.undotree")

local loaded_deps = {}

local autocmd = vim.api.nvim_create_autocmd

-- why am i doing this even???
local function install(p)
	local version

	if p.branch then
		version = p.branch
	else
		version = p.version and vim.version.range(p.version)
	end

	print(version)

	vim.pack.add({
		{
			src = "https://github.com/" .. p[1],
			version = version,
		},
	})

	if p.dependencies ~= nil then
		for _, d in pairs(p.dependencies) do
			local name
			local d_version = nil
			if type(d) == "string" then
				name = d
			end
			if type(d) == "table" then
				name = d[1]
				if d.branch then
					d_version = d.branch
				else
					d_version = d.version and vim.version.range(d.version)
				end
			end

			if not loaded_deps[name] then
				vim.pack.add({ { src = "https://github.com/" .. name, version = d_version } })
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
