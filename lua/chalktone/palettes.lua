local colors = require('chalktone.colors')

---@alias Palette table<string, Hex>

--- Generate the default palette
---@return Palette
local _generate_default = function()
	local base = {
    -- stylua: ignore start
    fg_main       	  = "#ECE1D7",
    select_hl     	  = "#524f4c",
    cursorline    	  = "#403d3b",
    bg_washed     	  = "#34302C",
    bg_main       	  = "#292522",
    black         	  = "#000000",

    comments      	  = "#91908e",
    ui_accent     	  = "#a08264",
    cursor_line_nr    = "#f9a03f",
    delimiter     	  = "#d7b475",

    var_main      	  = "#ECE1D7",
    func          	  = "#9fc6b8",
    method            = "#8fd1b9",
    string        	  = "#9db2d2",
    type              = "#f1b47e",
    field             = "#fbdc98",
    keyword        	  = "#cd88b8",
    constant      	  = "#dfaad2", -- and numbers
    preproc        	  = "#cfbfe3",
    operator      	  = "#D47766",
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
	default = _generate_default,
}

local M = {}

---@param palette_name string
---@return Palette
local _setup_palette = function(palette_name)
	local p = _builtin_palettes[palette_name]() or _builtin_palettes['default']()
	local blend = colors.blend_hex_colors
	local trans = colors.hex_trans_with_hsl

  -- stylua: ignore start
	p.bg_statusline1  = blend(p.select_hl, p.bg_main, 0.6)
	p.bg_statusline2  = blend(p.select_hl, p.bg_main, 0.2)
	p.func_param      = trans(p.fg_main, -15, -75, -10)
	p.hint            = trans(p.hint, 20, 10, 10) -- tweaking
	-- stylua: ignore end

	return p
end

--- Grabs the palette from the builtins then extends and returns it.
---@param palette_name string
---@return Palette
M.setup = function(palette_name)
	M.palette = _setup_palette(palette_name)
	return M.palette
end

return M
