local M = {}

M.default = function()
	---@class Config
	local _default = {
		palette_name = "Default",
		formatting = {
			Comment = {
				italic = true,
				bold = true,
			},
		},
	}
	return _default
end

---comment
---@param opts Config?
---@return Config
M.merge_options = function(opts)
	opts = opts or {}
	return vim.tbl_deep_extend("force", M.default(), opts)
end

return M
