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

M.blend_colors = function(hex1, hex2, weight)
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
