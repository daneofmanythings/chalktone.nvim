local M = {}
---@alias Highlight table<string,string|boolean>

---@alias Theme table<string,Highlight> -- This should contain a highlight class, but not sure of the def for it yet

---@return Theme
M.setup = function()
	local config = require("firelight.config")
	local styling = config.options.formatting
	local palette_name = config.options.palette_name

	local colors = require("firelight.colors")
	local p = colors.setup(palette_name)

	local highlights = {
		-----------------------------------
		--            EDITOR             --
		-----------------------------------
		Normal = { fg = p.ui.fg_main, bg = p.ui.bg_main },
		NormalFloat = { bg = p.ui.bg_highlight },
		Visual = { bg = p.ui.fg_highlight },

		Pmenu = { link = "NormalFloat" },
		PmenuSel = { bg = p.ui.fg_highlight },
		PmenuSbar = { link = "Pmenu" },
		PmenuThumb = { link = "PmenuSel" },

		Cursor = { fg = p.ui.bg_main, bg = p.ui.fg_main },
		CursorIM = { link = "Cursor" },

		CursorColumn = { bg = p.ui.bg_cursorline },
		CursorLine = { link = "CursorColumn" },
		SignColumn = { bg = p.ui.bg_main },
		SignColumnSB = { link = "SignColumn" },

		LineNr = { fg = p.ui.accent_dark },
		CursorLineNr = { fg = p.ui.accent_bold },

		Directory = { fg = p.ui.dir },
		Title = { fg = p.ui.accent_bold },
		ErrorMsg = { bg = p.diag.error },
		WarningMsg = { bg = p.diag.warn },
		WildMenu = { bg = p.ui.accent_light },

		-----------------------------------
		--            SYNTAX             --
		-----------------------------------
		Comment = { fg = p.syntax.comment }, --styles = opts.styles.comments },
		Identifier = { fg = p.syntax.identifier },
		Function = { fg = p.syntax.func },
		Constant = { fg = p.syntax.constant },
		String = { fg = p.syntax.string },
		Character = { fg = p.syntax.character },
		Number = { fg = p.syntax.number },
		Boolean = { link = "Number" },
		Statement = { fg = p.syntax.statement },
		Operator = { fg = p.syntax.operator },
		PreProc = { fg = p.syntax.preproc },
		Type = { fg = p.syntax.type },
		Special = { fg = p.syntax.special },
		Delimiter = { fg = p.syntax.delimiter },
		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },

		-- Ignore = { fg = a.ui },
		-- Error = { bg = d.red },
		-- Todo = { fg = a.com, bold = fv.bold },

		------------------------------------
		--           TREESITTER           --
		------------------------------------

		------------------------------------
		--          INTEGRATIONS          --
		------------------------------------

		-- GITSIGNS
		GitSignsAdd = { fg = p.git.signs.add },
		GitSignsChange = { fg = p.git.signs.change },
		GitSignsDelete = { fg = p.git.signs.delete },
	}

	highlights = M._apply_styling(styling, highlights)

	return highlights
end

M._apply_styling = function(styling, highlights)
	if type(styling) ~= "table" then
		-- assert(1 == 0, "Something other than a table was passed to _apply_styling")
		return highlights
	end

	for _, style in pairs(styling) do
		style = M._sanitize_style(style)
	end

	return vim.tbl_deep_extend("force", highlights, styling)
end

M._sanitize_style = function(style)
	for attr_name, _ in pairs(style) do
		if not M._validate_hl_attr(attr_name) then
			style[attr_name] = nil
		end
	end
	return style
end

local _valid_attr_names = {
	-- :h nvim_set_hl
	fg = true, -- color name or "#RRGGBB"
	bg = true, -- color name or "#RRGGBB"
	sp = true, -- color name or "#RRGGBB"
	blend = false, -- integer between 0 and 100
	bold = true, -- boolean
	standout = false, -- boolean
	underline = true, -- boolean
	undercurl = true, -- boolean
	underdouble = false, -- boolean
	underdotted = false, -- boolean
	underdashed = false, -- boolean
	strikethrough = true, -- boolean
	italic = true, -- boolean
	reverse = false, -- boolean
	nocombine = false, -- boolean
	link = true, -- name of another highlight group to link to. :hi-link
}

---comment validates the attr name as one the color scheme supports altering
---@param attr_name string
---@return boolean
M._validate_hl_attr = function(attr_name)
	return _valid_attr_names[attr_name] == true
end

return M
