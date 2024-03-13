local colors = require('firelight.colors')

---@class Palette
local _default = {
  -- stylua: ignore start
	fg_main       	  = "#ECE1D7",
	select_hl     	  = "#524f4c",
	cursorline    	  = "#403d3b",
	bg_washed     	  = "#34302C",
  -- bg_main       	  = "#141b41",
	bg_main       	  = "#292522",
	black         	  = "#000000",

	comments      	  = "#91908e",
	ui_accent     	  = "#a08264",
	delimiter     	  = "#d7b475",

  var_main      	  = "#ECE1D7",
	-- type          	  = "#89B3B6",
	func          	  = "#9fc6b8",
  method            = "#8fd1b9",
	string        	  = "#9db2d2",
	type              = "#f1b47e",
  field             = "#f5dcc6",
  keyword        	  = "#cd88b8",
	constant      	  = "#dfaad2", -- and numbers
	preproc        	  = "#cfbfe3",
	-- preproc       	  = "#cd8f65",
	operator      	  = "#D47766",

  puce          	  = "#d6a2ad",
  khaki         	  = "#c3b59f",
  olivine       	  = "#a0af84",
  viridian      	  = "#668f80",
  paynes_gray   	  = "#4a6670",
  glaucous      	  = "#7d82b8",
  russet        	  = "#7a4419",
  bright_pink   	  = "#ef476f",
  flourescent_cyan  = "#00e5e8",
  screamin_green    = "#87ff65",
  carrot_orange     = "#f9a03f",
  jasmine           = "#fbdc98",
  cream             = "#eaefb1",
  nyanza            = "#e9f7ca",
  pale_dogwood      = "#ceb5a7",
  isabelline        = "#f2efe9",
  cordovan          = "#904e55",
  ecru              = "#bfb48f",
  slate_gray        = "#767b91",
  rufous            = "#a33b20",

	ok            	  = "#78997A",
	warn          	  = "#EBC06D",
	info          	  = "#7F91B2",
	hint          	  = "#9C848F",
	error_light   	  = "#BD8183",
	error_dark    	  = "#7D2A2F",

	pop1          	  = "#69f59c",

	idk1          	  = "#85B695",
	idk2          	  = "#7B9695",
	idk3          	  = "#253333",
	idk4          	  = "#273142",
	-- stylua: ignore end
}

_default.bg_statusline1 = colors.blend_colors(_default.select_hl, _default.bg_main, 0.6)
_default.bg_statusline2 = colors.blend_colors(_default.select_hl, _default.bg_main, 0.2)

---@class Palette
local _testing = {}

-- NOTE: Add the color palettes here by name
local _builtin_palettes = {
	default = _default,
	testing = _testing,
}

local M = {}

-- Safeguard. Probably don't need
M.palette = _builtin_palettes.default

---comment
---@param palette_name string
local get_palette = function(palette_name)
	return _builtin_palettes[palette_name] or _builtin_palettes.default
end

---comment Grabs the palette from the builtins then extends and returns it.
---@param palette_name string
---@return Palette
M.setup = function(palette_name)
	M.palette = get_palette(palette_name)
	return M.palette
end

return M
