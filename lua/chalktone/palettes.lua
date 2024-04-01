local colors = require('chalktone.colors')
local M = {}
local blend = colors.hex_blend_with_rgb
local trans = colors.hex_trans_with_hsl

---@alias Palette table<string, Hex>

--- Generate the default palette
---@return Palette
M.generate_default = function()
	local base = {
    -- stylua: ignore start
    fg_main       	  = "#ece1d7",
    select_hl     	  = "#524f4c",
    cursorline    	  = "#403d3b",
    bg_washed     	  = "#34302c",
    bg_main       	  = "#292522",

    comments      	  = "#91908e",
    ui_accent     	  = "#a08264",
    cursor_line_nr    = "#f9a03f",
    delimiter     	  = "#d7b475",

    func          	  = "#9fc6b8",
    method            = "#8fd1b9",
    string        	  = "#9db2d2",
    type              = "#f1b47e",
    field             = "#fbdc98",
    keyword        	  = "#cd88b8",
    constant      	  = "#dfaad2", -- and numbers
    preproc        	  = "#cfbfe3",
    operator      	  = "#d47766",
    green          	  = "#89B3B6",

    ok            	  = "#78997A",
    warn          	  = "#EBC06D",
    info          	  = "#7F91B2",
    hint          	  = "#9C848F",
    error_light   	  = "#BD8183",
    error_dark    	  = "#7D2A2F",

    pop1          	  = "#69f59c",
		-- stylua: ignore end
	}

	return base
end

M.generate_saturated = function()
	local p = M.generate_default()
  -- stylua: ignore start
	p.bg_main     = blend('#000000', p.bg_main,   0.3)
	p.bg_washed   = blend('#000000', p.bg_washed, 0.85)
  p.comments    = blend(p.fg_main, p.comments,  .7)
  p.ui_accent   = blend(p.fg_main, p.ui_accent, 0.8)
  p.string      = blend(p.fg_main, p.string,    0.8)

	p.func        = trans(p.func,     0, 10, 10)
	p.type        = trans(p.type,     0, 20, 10)
	p.field       = trans(p.field,    0, 30, 0)
	p.keyword     = trans(p.keyword,  0, 20, 10)
	p.constant    = trans(p.constant, 0, 20, 30)
	p.preproc     = trans(p.preproc,  0, 30, 0)
	p.operator    = trans(p.operator, 0, 15, 10)
	-- stylua: ignore end

	return p
end

local _generate_testers = function()
	local testers = {
    -- stylua: ignore start
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
    -- jasmine           = "#fbdc98",
    cream             = "#eaefb1",
    nyanza            = "#e9f7ca",
    pale_dogwood      = "#ceb5a7",
    isabelline        = "#f2efe9",
    cordovan          = "#904e55",
    ecru              = "#bfb48f",
    rufous            = "#a33b20",
    slate_gray        = "#767b91",
		-- stylua: ignore end
	}
	return testers
end

-- NOTE: Add the color palettes here by name
local _builtin_palettes = {
	default = M.generate_default,
	saturated = M.generate_saturated,
}

---@param palette_name string
---@return any
local _get_palette = function(palette_name)
	if type(palette_name) ~= 'string' then
		return _builtin_palettes['default']()
	else
		return _builtin_palettes[palette_name or 'default']()
	end
end

---@param palette table
---@return Palette
M.setup_palette = function(palette)
	local p = palette

  -- stylua: ignore start
	p.bg_statusline1  = blend(p.select_hl, p.bg_main, 0.6)
	p.bg_statusline2  = blend(p.select_hl, p.bg_main, 0.2)

	p.func_param      = trans(p.fg_main, -15, -75, -10)
  p.member          = blend(p.string, p.fg_main, .5)
	p.hint            = trans(p.hint, 0, 10, 50) -- tweaking
  p.type_builtin    = blend(p.type, p.field, .5)

  p.header1         = p.cursor_line_nr
  p.header2         = blend(p.cursor_line_nr, p.preproc, .2)
  p.header3         = blend(p.cursor_line_nr, p.preproc, .4)
  p.header4         = blend(p.cursor_line_nr, p.preproc, .6)
  p.header5         = blend(p.cursor_line_nr, p.preproc, .8)
  p.header6         = p.preproc
	-- stylua: ignore end

	return p
end

---@param theme string
---@param palette table
---@return Palette
M.setup = function(theme, palette)
	local base = _get_palette(theme)
	if type(palette) ~= 'table' then
		M.palette = M.setup_palette(base)
	else
		local custom = vim.tbl_deep_extend('keep', palette, base)
		M.palette = M.setup_palette(custom)
	end

	return M.palette
end

return M
