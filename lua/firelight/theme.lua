local M = {}

M.setup = function(opts)
	local theme = {
		config = opts,
		colors = require("firelight.colors").setup(opts.palette),
	}

	local c = theme.colors
	theme.highlights = {
		Normal = { fg = c.ui.fg, bg = c.ui.bg },
		NormalFloat = "Normal",

		Pmenu = "NormalFloat",
		PmenuSel = { bg = c.ui.fg_highlight },
		PmenuSbar = "Pmenu",
		PmenuThumb = "PmenuSel",

		Cursor = { fg = c.ui.bg, bg = c.ui.fg },
		-- lCursor = {}
		CursorIM = "Cursor",

		CursorColumn = { bg = c.ui.bg_fade },
		CursorLine = "CursorColumn",

		Directory = { fg = c.ui.dir },
	}

	return theme
end

return M
