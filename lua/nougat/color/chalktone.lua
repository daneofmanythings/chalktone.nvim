local p = require('chalktone.palettes').palette

local M = {}

M.get = function()
	return {
		red = p.error_light,
		green = p.green,
		yellow = p.type,
		blue = p.string,
		magenta = p.keyword,
		cyan = p.green,

		accent = {
			red = p.operator,
			green = p.func,
			yellow = p.field,
			blue = p.preproc,
			magenta = p.constant,
			cyan = p.method,
			bg = p.select_hl,
			fg = p.fg_main,
		},

		bg = p.bg_main,
		bg0 = p.bg_washed,
		bg1 = p.cursorline,
		bg2 = p.bg_statusline1,
		bg3 = p.bg_statusline2,
		bg4 = p.func_param,

		fg = p.fg_main,
		fg0 = p.fg_main,
		fg1 = p.fg_main,
		fg2 = p.fg_main,
		fg3 = p.fg_main,
		fg4 = p.fg_main,
	}
end

return M
