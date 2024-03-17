local M = {}

M.options = {
	palette_name = 'Default',
	formatting = {
		italics = true,
		raw = {
			Comment = {
				italic = true,
			},
			String = {
				italic = true,
			},
		},
	},
}

M.setup = function(opts)
	M.options = M.merge_options(opts)
end

M.merge_options = function(opts)
	return vim.tbl_deep_extend('force', M.options, opts or {})
end

return M
