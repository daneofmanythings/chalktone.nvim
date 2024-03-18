---@alias Hex string
---
---@class RGB
---@field red integer
---@field green integer
---@field blue integer
---
---@class HSL
---@field hue integer
---@field saturation number
---@field luminance number

local M = {}

---@param hex Hex
---@return RGB
M.hex_to_rgb = function(hex)
	return {
		red = tonumber(string.sub(hex, 2, 3), 16),
		green = tonumber(string.sub(hex, 4, 5), 16),
		blue = tonumber(string.sub(hex, 6, 7), 16),
	}
end

---@param rgb RGB
---@return Hex
M.rgb_to_hex = function(rgb)
	return string.format('#%.2x%.2x%.2x', rgb.red, rgb.green, rgb.blue)
end

---@param rgb RGB
---@return HSL
M.rgb_to_hsl = function(rgb)
	-- find the min and max of rgb
	local m = M._min_max_rgb(rgb)
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
		hue = (rgb.green - rgb.blue) / range
	elseif m.max.color == 'green' then
		hue = (2 * range + rgb.blue - rgb.red) / range
	else
		hue = (4 * range + rgb.red - rgb.green) / range
	end

	return {
		hue = hue * 60, -- normalize and convert to degrees
		saturation = saturation, -- normalize
		luminance = luminance / 510, -- normalize and divide by from earlier
	}
end

---@param rgb RGB
---@return table
M._min_max_rgb = function(rgb)
	local mini = { color = '', val = 256 }
	local maxi = { color = '', val = -1 }
	for color, value in pairs(rgb) do
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

---@param hex Hex
---@return HSL
M.hex_to_hsl = function(hex)
	return M.rgb_to_hsl(M.hex_to_rgb(hex))
end

---@param hex1 Hex
---@param hex2 Hex
---@param weight number -- [0, 1]
---@return Hex
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
