local M = {}

local _generate_default = function()
	local options = {
		theme = 'default',
		formatting = {
			builtin_strings = {
				styling = { italic = true },
				groups = {
					'String',
					'Character',
					'Comment',
				},
			},
			builtin_bg_fading = {
				groups = {
					'NormalNC',
					'NormalFloatNC',
				},
			},
			builtin_transparent = {
				groups = {
					'Normal',
					'NormalNC',
					'NormalFloat',
					'NormalFloatNC',
					'SignColumn',
					'StatusLine',
					'StatusLineNC',
					'Pmenu',
					'WinSeparator',
					'VertSplit',
					'Folded',
					-- integrations
					'FlashBackdrop',
				},
			},
		},
		format_by_group = {
			-- Comment = { italic = false, },
			-- String = { italic = false, },
		},
	}

	return options
end

M._convert_formatting = function(formatting)
	local converted = {}
	for _, tbl in pairs(formatting or {}) do
		local styling = tbl.styling
		local groups = tbl.groups
		for _, group in ipairs(groups or {}) do
			if styling then
				converted[group] = styling
			end
		end
	end

	return converted
end

M._squash_formatting = function(options)
	local converted_formatting = M._convert_formatting(options.formatting)
	options.formatting = nil
	options.format_by_group = vim.tbl_deep_extend('force', converted_formatting, options.format_by_group or {})

	return options
end

M.setup = function(options)
	local defaults = _generate_default()

	local config = vim.tbl_deep_extend('force', defaults, options or {})
	config = M._squash_formatting(config)

	M.options = config
end

return M
