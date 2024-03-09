local Config = require("firelight.config")

local M = {}

M.setup = Config.setup

---comment Called by neovim when loading the colorscheme.
M.__load = function()
	vim.cmd("hi clear")
	vim.cmd("syntax reset")
	vim.o.termguicolors = true
	vim.g.colors_name = "firelight"

	---@type Theme
	local theme = require("firelight.theme").setup()
	-- local theme = require("firelight.theme").setup(require("firelight.config").default())

	M.set_highlights(theme)
end

---comment Loops through the highlights from the theme and sets them
---@param highlights any
M.set_highlights = function(highlights)
	for hl_group, attrs in pairs(highlights) do
		vim.api.nvim_set_hl(0, hl_group, attrs)
	end
end

return M
