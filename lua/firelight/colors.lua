---@class Palette
local _default = {
	fg_main = "#ECE1D7",
	select_hl = "#524f4c",
	cursorline = "#363432",
	bg_washed = "#34302C",
	bg_main = "#292522",
	black3 = "#000000",

	comments = "#91908e",
	ui_accent = "#867462",
	delimiter = "#8B7449",
	punctuation = "#D47766",

	ok = "#78997A",
	warn = "#EBC06D",
	info = "#7F91B2",
	hint = "#938794",
	error_light = "#BD8183",
	error_dark = "#7D2A2F",

	pop1 = "#69f59c",
	idk1 = "#85B695",
	idk2 = "#89B3B6",
	idk3 = "#253333",
	idk4 = "#273142",

	type = "#7B9695",
	string = "#A3A9CE",
	statement = "#E49B5D",
	number = "#CF9BC2",
	constant = "#B380B0",
	preproc = "#987fb8",
}

-- NOTE: Add the color palettes here by name
local _Builtin_palettes = {
	default = _default,
}

local M = {}

---comment Grabs the palette from the builtins and returns it.
---@param palette_name string
---@return Palette
M.setup = function(palette_name)
	return _Builtin_palettes[palette_name] or _default -- only default exists right now
end

return M
