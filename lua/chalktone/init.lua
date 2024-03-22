local Config = require('chalktone.config')

local M = {}

M.setup = Config.setup

--- Called by neovim when loading the colorscheme.
M.__load = function()
	vim.cmd('hi clear')
	vim.cmd('syntax reset')
	vim.o.termguicolors = true
	vim.g.colors_name = 'chalktone'

	---@type Theme
	local theme = require('chalktone.theme').setup()

	M.set_highlights(theme)
end

M.set_highlights = function(highlights)
	for hl_group, attrs in pairs(highlights) do
		vim.api.nvim_set_hl(0, hl_group, attrs)
	end
end

return M
