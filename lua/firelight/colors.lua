---@class ColorData
local _default = {
	white = "#ECE1D7", -- a.fg
	grey1 = "#524f4c", -- a.sel
	grey2 = "#363432",
	black1 = "#34302C", -- a.float
	black2 = "#292522", -- a.bg
	black3 = "#000000",

	tan1 = "#C1A78E", -- a.com
	tan2 = "#867462", -- a.ui

	red1 = "#BD8183", -- c.red
	red2 = "#D47766", -- b.red
	red3 = "#7D2A2F", -- d.red

	green1 = "#85B695", -- b.green
	green2 = "#78997A", -- c.green
	green3 = "#233524", -- d.green

	cyan1 = "#89B3B6", -- b.cyan
	cyan2 = "#7B9695", -- c.cyan
	cyan3 = "#253333", -- d.cyan

	blue1 = "#A3A9CE", -- b.blue
	blue2 = "#7F91B2", -- c.blue
	blue3 = "#273142", -- d.blue

	yellow1 = "#EBC06D", -- b.yellow
	yellow2 = "#E49B5D", -- c.yellow
	yellow3 = "#8B7449", -- d.yellow

	magenta1 = "#CF9BC2", -- b.magenta
	magenta2 = "#B380B0", -- c.magenta
	magenta3 = "#422741", -- d.magenta
}

-- NOTE: Add the color palettes here by name
local _Builtin_palettes = {
	default = _default,
}

local M = {}

---comment Assigns colors from the ColorData to human unerstandable values in a palette to be used by the theme.
---@param palette_name string
---@return Palette
M.setup = function(palette_name)
	---comment Pulling the raw color data in to be used to construct a palette
	---@class ColorData
	local cd = _Builtin_palettes[palette_name] or _default -- only default exists right now

	---@class Palette
	local palette = {}

	palette.ui = {
		fg_main = cd.white,
		fg_float = cd.white,
		fg_highlight = cd.grey1,

		bg_main = cd.black2,
		bg_float = cd.black3,
		bg_highlight = cd.grey2,

		bg_cursorline = cd.grey2,

		accent_light = cd.tan1,
		accent_dark = cd.tan2,
		accent_bold = cd.yellow2,

		win_border = cd.white,

		dir = cd.blue2,
	}

	palette.diag = {
		error = cd.red3,
		warn = cd.yellow3,
		hint = cd.cyan1,
		info = cd.magenta2,
	}

	palette.git = {
		signs = {
			add = cd.green2,
			change = cd.yellow1,
			delete = cd.red2,
		},
		diff = {
			add = cd.green1,
			change = cd.yellow3,
			delete = cd.red1,
			text = cd.yellow2,
		},
	}

	palette.syntax = {
		comment = cd.tan1,
		identifier = cd.white,
		func = cd.yellow2,
		constant = cd.magenta2,
		string = cd.blue1,
		character = cd.blue1,
		number = cd.magenta1,
		Boolean = cd.magenta1,

		statement = cd.yellow2,
		operator = cd.red1,
		preproc = cd.green1,
		type = cd.cyan2,
		special = cd.yellow2,
		delimiter = cd.yellow3,
	}

	return palette
end

return M
