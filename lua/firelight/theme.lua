local M = {}

M.setup = function(opts)
	local theme = {
		config = opts,
		colors = require("firelight.colors").setup(opts.palette),
	}

	local c = theme.colors
	theme.highlights = {
		Normal = { fg = c.ui.fg, bg = c.ui.bg },
	}

	return theme
end

return M
