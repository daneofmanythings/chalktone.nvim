local M = {}

---@type Config
M.__config = {}

---comment Accepts the users options and stores them locally to be used when loaded.
---@param opts Config?
M.setup = function(opts)
	local cfg = require("firelight.config")
	opts = cfg.merge_options(opts)
	M.__config = opts
end

---comment Called by neovim when loading the colorscheme. Sets the highlight groups
M.__load = function()
	vim.cmd("hi clear")
	vim.cmd("syntax reset")
	vim.o.termguicolors = true
	vim.g.colors_name = "firelight"

	---@type Theme
	local theme = require("firelight.theme").setup(M.__config)

	M.set_highlights(theme)
end

---comment Loops through the highlights from the theme and sets them
---@param highlights any
M.set_highlights = function(highlights)
	for hl_group, attrs in pairs(highlights) do
		vim.api.nvim_set_hl(0, hl_group, attrs)
		-- M.highlight(hl_group, attrs)
	end
end

-- ---comment
-- ---@param hl_group string
-- ---@param attrs table
-- M.highlight = function(hl_group, attrs)
-- 	vim.api.nvim_set_hl(0, hl_group, attrs)
-- end
--
return M
