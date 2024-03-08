local M = {}

M.setup = function(opts)
	local defaults = require("firelight.config").default
	opts = opts or {}
	opts = vim.tbl_deep_extend("force", defaults, opts)

	vim.o.termguicolors = true
	vim.g.colors_name = "firelight"

	local theme = require("firelight.theme").setup(opts)

	M.highlight(theme.highlights)
end

-- TODO: This will need to be ajusted to fit styling data into the highlighting
M.highlight = function(hls)
	for group, attrs in pairs(hls) do
		if type(attrs) == "table" then -- this logic is defined by the data shape in theme.lua.
			vim.api.nvim_set_hl(0, group, attrs)
		else
			vim.api.nvim_set_hl(0, group, { link = attrs })
		end
	end
end

return M
