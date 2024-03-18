local M = {}

M.hex_to_rgb = function(hex_color)
	return {
		red = tonumber(string.sub(hex_color, 2, 3), 16),
		green = tonumber(string.sub(hex_color, 4, 5), 16),
		blue = tonumber(string.sub(hex_color, 6, 7), 16),
	}
end

M.rgb_to_hex = function(rgb_table)
	return string.format('#%.2x%.2x%.2x', rgb_table.red, rgb_table.green, rgb_table.blue)
end

M.rgb_to_hsl = function(rgb_table)
	-- find the min and max of rgb
	local m = M._min_max_rgb(rgb_table)
	local range = m.max.val - m.min.val -- convenience

	-- We will divide by 2 later
	local luminance = (m.min.val + m.max.val)

	-- Find saturation
	local saturation -- FIXME: THIS IS WRONG. FIX IT.
	if m.min.val == m.max.val then
		saturation = 0
	elseif luminance <= 255 then
		saturation = range / (m.max.val + m.min.val)
	else
		saturation = range / (510 - range) -- I think it is this branch
	end

	-- Check Luminance level to select the correct Saturation Formula
	local hue
	if saturation == 0 then
		hue = 0
	elseif m.max.color == 'red' then
		hue = (rgb_table.green - rgb_table.blue) / range
	elseif m.max.color == 'green' then
		hue = (2 * range + rgb_table.blue - rgb_table.red) / range
	else
		hue = (4 * range + rgb_table.red - rgb_table.green) / range
	end

	return {
		hue = hue * 60, -- normalize and convert to degrees
		saturation = saturation, -- normalize
		luminance = luminance / 510, -- normalize and divide by from earlier
	}
end

M._min_max_rgb = function(rgb_table)
	local mini = { color = '', val = 256 }
	local maxi = { color = '', val = -1 }
	for color, value in pairs(rgb_table) do
		if value < mini.val then
			mini.color = color
			mini.val = value
		end
		if value > maxi.val then
			maxi.color = color
			maxi.val = value
		end
	end
	return { min = mini, max = maxi }
end

M.hex_to_hsl = function(hex)
	return M.rgb_to_hsl(M.hex_to_rgb(hex))
end

M.blend_hex_colors = function(hex1, hex2, weight)
	local rgb1 = M.hex_to_rgb(hex1)
	local rgb2 = M.hex_to_rgb(hex2)

	local blended_rgb = {
		red = math.floor((1 - weight) * rgb1.red + weight * rgb2.red),
		green = math.floor((1 - weight) * rgb1.green + weight * rgb2.green),
		blue = math.floor((1 - weight) * rgb1.blue + weight * rgb2.blue),
	}

	local blended_hex = M.rgb_to_hex(blended_rgb)
	return blended_hex
end

return M
