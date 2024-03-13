local p = require('firelight.palettes').palette

local firelight = {
	normal = {
		a = { fg = p.black, bg = p.fg_main, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.black },
		c = { fg = p.fg_main, bg = p.bg_washed },
	},
	insert = {
		a = { fg = p.bg_main, bg = p.string, gui = 'bold' },
		b = { fg = p.string, bg = p.bg_main },
	},
	visual = {
		a = { fg = p.bg_main, bg = p.fg_main, gui = 'bold' },
		b = { fg = p.fg_main, bg = p.bg_main },
	},
	command = {
		a = { fg = p.bg_main, bg = p.operator, gui = 'bold' },
		b = { fg = p.operator, bg = p.bg_main },
	},
	inactive = {
		a = { fg = p.bg_main, bg = p.comments, gui = 'bold' },
		b = { fg = p.comments, bg = p.bg_main },
	},
	replace = {
		a = { fg = p.bg_main, bg = p.func, gui = 'bold' },
		b = { fg = p.func, bg = p.bg_main },
	},
}

return firelight
