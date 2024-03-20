local M = {}

local _generate_default = function()
	local options = {
		theme = 'default',
		formatting = {
			comments = {
				styling = { italic = true },
				groups = {
					'Comment',
					'WildMenu',
					'CmpItemAbbr',
				},
			},
			conditionals = {},
			constants = {},
			keywords = {},
			numbers = {},
			operators = {},
			strings = {
				styling = { italic = true },
				groups = {
					'String',
					'Character',
				},
			},
			types = {},
			variables = {},
		},
		format_by_group = {
			-- Comment = {
			-- 	italic = false,
			-- },
			-- String = {
			-- 	italic = false,
			-- },
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
			converted[group] = styling
		end
	end

	return converted
end

local _squash_formatting = function(options)
	local converted_formatting = M._convert_formatting(options.formatting)
	options.formatting = nil
	options.format_by_group = vim.tbl_deep_extend('force', options.format_by_group, converted_formatting)

	return options
end

local _saturate_options = function(defaults, options)
	for name, tbl in pairs(options.formatting) do
		if not tbl['groups'] then
			tbl['groups'] = defaults.formatting[name].groups
		end
	end
	return options
end

M.setup = function(options)
	local defaults = _generate_default()
	options = _saturate_options(defaults, options)

	defaults = _squash_formatting(defaults)
	options = _squash_formatting(options or {})

	local config = vim.tbl_deep_extend('force', defaults, options or {})
	M.options = config
end

return M
