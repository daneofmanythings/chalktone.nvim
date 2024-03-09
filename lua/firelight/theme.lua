local M = {}
---@alias Theme table<string,any> -- This should contain a highlight class, but not sure of the def for it yet

---comment
---@param opts Config
---@return table
M.setup = function(opts)
	local styling = opts.formatting -- used down below after the base has been set
	local palette = require("firelight.colors").setup(opts.palette_name)

	local p = palette
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
		-- lCursor = {}
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
		-- Float = {},

		Statement = { fg = p.syntax.statement },
		-- Conditional = {},
		-- Repeat = {},
		-- Label = {},
		Operator = { fg = p.syntax.operator },
		-- Keyword = {},
		-- Exception = {},

		PreProc = { fg = p.syntax.preproc },
		-- Include = {},
		-- Define = {},
		-- Macro = {},
		-- PreCondit = {},

		Type = { fg = p.syntax.type },
		-- StorageClass = {},
		-- Structure = {},
		-- Typedef = {},

		Special = { fg = p.syntax.special },
		-- SpecialChar = {},
		-- Tag = {},
		Delimiter = { fg = p.syntax.delimiter },
		-- SpecialComment = {},
		-- Debug = {},

		-- Underlined = { underline = fv.underline },
		-- Bold = { bold = fv.bold },
		-- Italic = { italic = fv.italic },

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
		return highlights
	end
	-- -- Turning invalid styles to nil
	-- for _, style in pairs(styling) do
	-- 	for attr_name, _ in pairs(style) do
	-- 		if not M._validate_hl_attr(attr_name) then
	-- 			style[attr_name] = nil
	-- 		end
	-- 	end
	-- end
	return vim.tbl_deep_extend("force", highlights, styling)
end

local _valid_attr_names = {
	fg = true,
	bg = true,
	sp = true,
	bold = true,
	underline = true,
	undercurl = true,
	strikethrough = true,
	italic = true,
	link = true,
}

---comment validates the attr name as one the color scheme supports altering
---@param attr_name string
---@return boolean
M._validate_hl_attr = function(attr_name)
	return _valid_attr_names[attr_name] ~= nil
end
return M
