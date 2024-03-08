local M = {}

M.default = {
	white = "#ECE1D7", -- a.fg
	grey1 = "#524f4c", -- a.sel
	grey2 = "#363432",
	black1 = "#34302C", -- a.float
	black2 = "#292522", -- a.bg

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

-- grabbing the palette and setting up better names
M.setup = function(palette)
	local colors = M[palette] or M.default -- only default exists right now

	colors.ui = {
		fg = colors.white,
		fg_float = colors.white,
		fg_highlight = colors.grey1,

		bg = colors.black1,
		bg_float = colors.black2,
		bg_highlight = colors.grey2,

		bg_fade = colors.grey2,

		accent_light = colors.tan1,
		accent_dark = colors.tan2,
		accent_bold = colors.yellow2,

		win_border = colors.white,

		dir = colors.blue2,
	}

	colors.diag = {
		error = colors.red3,
		warn = colors.yellow1,
		hint = colors.cyan1,
		info = colors.magenta2,
	}

	colors.git = {
		signs = {
			change = colors.yellow3,
			add = colors.green2,
			delete = colors.red2,
		},
		diff = {
			add = colors.green1,
			delete = colors.red1,
			change = colors.yellow1,
			text = colors.yellow2,
		},
	}

	colors.syntax = {
		comment = colors.magenta1,
	}

	return colors
end

return M
