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
				styling = {
					italic = true,
				},
				groups = {
					'String',
					'Character',
				},
			},
			types = {},
			variables = {},
		},
		format_by_group = {
			-- Examples:
			Comment = {
				italic = true,
				-- underline = true,
			},
			String = {
				italic = true,
				-- 	fg = '#ff0000'
			},
		},
	}

	return options
end

M.options = _generate_default()
-- M.options = options

M.setup = function(opts)
	local config = vim.tbl_deep_extend('force', M.options, opts or {})
	-- local formatting = config.formatting
	-- local by_groups = config.format_by_groups
	-- local new_by_groups = {}
	-- for _, style_grouping in ipairs(formatting) do
	-- 	local groups = style_grouping.groups
	-- 	local styling = style_grouping.styling
	-- 	for _, group in ipairs(groups) do
	-- 		new_by_groups[group] = vim.tbl_deep_extend('force', by_groups[group], styling)
	-- 	end
	-- end
	-- config.format_by_groups = new_by_groups
	M.options = config
end

return M
