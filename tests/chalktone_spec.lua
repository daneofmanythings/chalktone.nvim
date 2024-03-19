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

	-- it('setup: check opts', function()
	-- 	local opts = require('chalktone.config').options
	-- 	local theme = theme.setup()
	-- end)

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

describe('colors.lua |', function()
	local C
	before_each(function()
		C = require('chalktone.colors')
	end)

	local abs = math.abs

	local hex_equality_tolerance = function(hex1, hex2) -- hsl transformations drift slightly
		local rgb1 = C.hex_to_rgb(hex1)
		local rgb2 = C.hex_to_rgb(hex2)
		local red_diff = abs(rgb1.red - rgb2.red)
		local green_diff = abs(rgb1.green - rgb2.green)
		local blue_diff = abs(rgb1.blue - rgb2.blue)
		return red_diff < 3 and green_diff < 3 and blue_diff < 3
	end

	it('hex to rbg...', function()
		local test_cases = {
			{ name = 'black', hex = '#000000', rgb = { red = 0, green = 0, blue = 0 } },
			{ name = 'green', hex = '#69f59c', rgb = { red = 105, green = 245, blue = 156 } },
		}
		for _, tc in ipairs(test_cases) do
			it(tc.name, function()
				local result = C.hex_to_rgb(tc.hex)
				assert.are.same(tc.rgb, result)
			end)
		end
	end)

	it('rgb to hex...', function()
		local test_cases = {
			{ name = 'black', hex = '#000000', rgb = { red = 0, green = 0, blue = 0 } },
			{ name = 'green', hex = '#69f59c', rgb = { red = 105, green = 245, blue = 156 } },
		}
		for _, tc in ipairs(test_cases) do
			it(tc.name, function()
				local result = C.rgb_to_hex(tc.rgb)
				assert.are.same(tc.hex, result)
			end)
		end
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

	it('hex to hsl...', function()
		local test_cases = {
			{ name = 'green1', hex = '#69f59c', expected = { hue = 141.86, saturation = 0.88, luminance = 0.69 } },
			{ name = 'red1', hex = '#c9194b', expected = { hue = 342.95, saturation = 0.78, luminance = 0.44 } },
			{ name = 'yellow1', hex = '#fbdc98', expected = { hue = 41.21, saturation = 0.93, luminance = 0.79 } },
			{ name = 'purple1', hex = '#362698', expected = { hue = 248.42, saturation = 0.60, luminance = 0.37 } },
			{ name = 'pink1', hex = '#bf40bf', expected = { hue = 300.00, saturation = 0.50, luminance = 0.50 } },
			{ name = 'lavendar1', hex = '#7e7eb8', expected = { hue = 240.0, saturation = 0.29, luminance = 0.61 } },
		}
		for _, tc in ipairs(test_cases) do
			it('testing color: ' .. tc.name, function()
				local result = C.hex_to_hsl(tc.hex)
				for part, val in pairs(result) do
					result[part] = tonumber(string.format('%.2f', val))
				end
				assert.are.same(tc.expected, result)
			end)
		end
	end)

	it('hsl to hex...', function()
		local test_cases = {
			{ name = 'green1', expected = '#69f59c', hsl = { hue = 141.86, saturation = 0.88, luminance = 0.69 } },
			{ name = 'red1', expected = '#c9194b', hsl = { hue = 342.95, saturation = 0.78, luminance = 0.44 } },
			{ name = 'yellow1', expected = '#fbdc98', hsl = { hue = 41.21, saturation = 0.93, luminance = 0.79 } },
			{ name = 'blue1', expected = '#362698', hsl = { hue = 248.3, saturation = 0.601, luminance = 0.373 } },
			{ name = 'pink1', expected = '#bf40bf', hsl = { hue = 300.00, saturation = 0.50, luminance = 0.50 } },
			{ name = 'lavendar1', expected = '#7e7eb8', hsl = { hue = 240.0, saturation = 0.29, luminance = 0.61 } },
		}
		for _, tc in ipairs(test_cases) do
			it('testing color: ' .. tc.name, function()
				local result = C.hsl_to_hex(tc.hsl)
				assert.are.equal(hex_equality_tolerance(tc.expected, result), true)
			end)
		end
	end)

	it('hex to hsl to hex...', function()
		local test_cases = {
			{ name = 'green1', hex = '#69f59c' },
			{ name = 'red1', hex = '#c9194b' },
			{ name = 'red0', hex = '#ff0000' },
			{ name = 'yellow1', hex = '#fbdc98' },
			{ name = 'purple1', hex = '#362698' },
			{ name = 'pink1', hex = '#bf40bf' },
			{ name = 'lavendar1', hex = '#7e7eb8' },
		}
		for _, tc in ipairs(test_cases) do
			it('testing color: ' .. tc.name, function()
				local result = C.hsl_to_hex(C.hex_to_hsl(tc.hex))
				assert.are.equal(hex_equality_tolerance(tc.hex, result), true)
			end)
		end
	end)

	it('_lerp check...', function()
		local test_cases = {
			{ name = 'no t', val = 0.5, max = 1, t = 0, expected = 0.5 },
			{ name = 'all t', val = 0.5, max = 1, t = 1, expected = 1 },
			{ name = 'some t', val = 0.5, max = 1, t = 0.5, expected = 0.75 },
			{ name = 'too much t', val = 0.5, max = 1, t = 1.5, expected = 1 },
			{ name = 'some neg t', val = 0.5, max = 1, t = -0.5, expected = 0.25 },
			{ name = 'too much neg t', val = 0.5, max = 1, t = -1.5, expected = 0 },
			{ name = 'bigger max', val = 25, max = 50, t = 0.5, expected = 37.5 },
		}
		for _, tc in ipairs(test_cases) do
			it('testing case: ' .. tc.name, function()
				local result = C._lerp(tc.val, tc.max, tc.t)
				assert.are.equal(tc.expected, result)
			end)
		end
	end)

	it('hex_trans...', function()
		local test_cases = {
			{ name = 'no transformation', hex = '#ff0000', rot_t = 0, sat_t = 0, lum_t = 0, expected = '#ff0000' },
			{ name = '120 rot', hex = '#ff0000', rot_t = 120, sat_t = 0, lum_t = 0, expected = '#00ff00' },
			{ name = '-240 rot', hex = '#ff0000', rot_t = -240, sat_t = 0, lum_t = 0, expected = '#00ff00' },
			{ name = '344 rot, 10 sat', hex = '#A3A9CE', rot_t = 344, sat_t = 10, lum_t = 0, expected = '#9db2d2' },
			{ name = '-16 rot, -90 sat', hex = '#A3A9CE', rot_t = -16, sat_t = -90, lum_t = 0, expected = '#b6b8ba' },
			{ name = '15 sat, 21 lum', hex = '#CF9BC2', rot_t = 0, sat_t = 15, lum_t = 21, expected = '#dfaad2' },
		}
		for _, tc in ipairs(test_cases) do
			it('testing case: ' .. tc.name, function()
				local result = C.hex_trans(tc.hex, tc.rot_t, tc.sat_t, tc.lum_t)
				-- print(tc.hex .. ' | ' .. result)
				assert.are.equal(hex_equality_tolerance(tc.expected, result), true)
			end)
		end
	end)
end)
