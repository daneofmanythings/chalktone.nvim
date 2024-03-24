local p = require('chalktone.palettes').palette

local chalktone = {
	normal = {
		a = { fg = p.bg_main, bg = p.fg_main, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_statusline1 },
		c = { fg = p.fg_main, bg = p.bg_statusline2 },
	},
	insert = {
		a = { fg = p.bg_main, bg = p.string, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_statusline1 },
	},
	visual = {
		a = { fg = p.bg_main, bg = p.keyword, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_statusline1 },
	},
	command = {
		a = { fg = p.bg_main, bg = p.operator, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_statusline1 },
	},
	inactive = {
		a = { fg = p.bg_main, bg = p.comments, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_statusline1 },
	},
	replace = {
		a = { fg = p.bg_main, bg = p.func, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_statusline1 },
	},
}

return chalktone
