---@diagnostic disable:undefined-global, undefined-field

describe('config', function()
	local cfg = require('chalktone.config')
	local default

	before_each(function()
		default = require('chalktone.config').options
	end)

	it('merge_options: nil opts', function()
		local opts = nil
		local expected = default
		local result = cfg.merge_options(opts)
		assert.are.same(result, expected)
	end)

	it('merge_options: non-overlapping opts', function()
		local opts = { test = { test = true } }
		local result = cfg.merge_options(opts)
		local expected = default
		expected.test = { test = true }
		assert.are.same(result, default)
	end)

	-- it('merge_options: overlapping opts', function()
	-- 	local opts = { formatting = { Comment = { italic = false } } }
	-- 	local result = cfg.merge_options(opts)
	-- 	local expected = default
	-- 	expected.formatting.Comment = { italic = false, bold = true }
	-- 	assert.are.same(result, expected)
	-- end)
end)

describe('theme', function()
	local theme = require('chalktone.theme')

	-- it('apply_styling: basic', function()
	-- 	local hls = { Comment = { fg = 'test', bg = 'test' } }
	-- 	local style = { Comment = { fg = 'not test', italic = true } }
	-- 	local expected = { Comment = { fg = 'not test', bg = 'test', italic = true } }
	-- 	local result = theme._apply_raw_formatting(style, hls)
	-- 	assert.are.same(expected, result)
	-- end)
	--
	-- it('apply_styling: invalid attr', function()
	-- 	local hls = { Comment = { fg = 'test', bg = 'test' } }
	-- 	local style = { Comment = { fg = 'not test', deez = true } }
	-- 	local expected = { Comment = { fg = 'not test', bg = 'test' } }
	-- 	local result = theme._apply_raw_formatting(style, hls)
	-- 	assert.are.same(expected, result)
	-- end)

	it('validate_styling: deez', function()
		local style = 'deez'
		local result = theme._validate_hl_attr(style)
		assert.are.same(false, result)
	end)

	it('validate_styling: italic', function()
		local style = 'italic'
		local result = theme._validate_hl_attr(style)
		assert.are.same(true, result)
	end)

	it('setup: check opts', function()
		local opts = require('chalktone.config').options
		local theme = theme.setup()
	end)

	it('sanity check 1', function()
		local hls = { a = { b = true, c = false } }
		local styling = { a = { c = true, d = true } }
		local expected = { a = { b = true, c = true, d = true } }
		local result = vim.tbl_deep_extend('force', hls, styling)
		assert.are.same(expected, result)
	end)
end)

describe('init:', function()
	it('config stored: no opts ', function()
		local m = require('chalktone')
		m.setup()
		local expected = { palette_name = 'Default', formatting = { Comment = { italic = true, bold = true } } }
		assert(expected, m.__config)
	end)

	it('config stored: some opts ', function()
		local m = require('chalktone')
		m.setup({ formatting = { Comment = { italic = false } } })
		local expected = { palette_name = 'Default', formatting = { Comment = { italic = false, bold = true } } }
		assert(expected, m.__config)
	end)
end)

describe('colors', function()
	local C
	before_each(function()
		C = require('chalktone.colors')
	end)

	it('hex to rbg: simple', function()
		local hex_color = '#000000'
		local expected = { red = 0, blue = 0, green = 0 }
		local result = C.hex_to_rgb(hex_color)
		assert.are.same(expected, result)
	end)

	it('hex to rbg: wierd green', function()
		local hex_color = '#69f59c'
		local expected = { red = 105, green = 245, blue = 156 }
		local result = C.hex_to_rgb(hex_color)
		assert.are.same(expected, result)
	end)

	it('rgb to hex: simple', function()
		local rgb_table = { red = 0, blue = 0, green = 0 }
		local expected = '#000000'
		local result = C.rgb_to_hex(rgb_table)
		assert.are.same(expected, result)
	end)

	it('rgb to hex: wierd green', function()
		local rgb_table = { red = 105, green = 245, blue = 156 }
		local expected = '#69f59c'
		local result = C.rgb_to_hex(rgb_table)
		assert.are.same(expected, result)
	end)

	it('blend colors: sanity check', function()
		local black = '#000000'
		local white = '#ffffff'

		local result_no_weight = C.blend_hex_colors(black, white, 0)
		local result_all_weight = C.blend_hex_colors(black, white, 1)
		assert.are.same(result_no_weight, black)
		assert.are.same(result_all_weight, white)
	end)

	it('blend colors: make purple', function()
		local red = '#ff0000'
		local blue = '#0000ff'
		local expected = '#7f007f'
		local result = C.blend_hex_colors(red, blue, 0.5)
		assert.are.same(expected, result)
	end)

	it('hex to hsl: wierd green', function()
		local hex_color = '#69f59c'
		local expected = { hue = 141.86, saturation = 0.88, luminance = 0.69 }
		local result = C.hex_to_hsl(hex_color)
		for color, val in pairs(result) do
			result[color] = tonumber(string.format('%.2f', val))
		end
		assert.are.same(expected, result)
	end)

	it('hex to hsl: wierd red', function()
		local hex_color = '#c9194b'
		local expected = { hue = 342.95, saturation = 0.78, luminance = 0.44 }
		local result = C.hex_to_hsl(hex_color)
		for color, val in pairs(result) do
			result[color] = tonumber(string.format('%.2f', val))
		end
		assert.are.same(expected, result)
	end)

	it('hex to hsl: weird yellow', function()
		local hex_color = '#fbdc98'
		local expected = { hue = 41.21, saturation = 0.93, luminance = 0.79 }
		local result = C.hex_to_hsl(hex_color)
		for color, val in pairs(result) do
			result[color] = tonumber(string.format('%.2f', val))
		end
		assert.are.same(expected, result)
	end)
end)
