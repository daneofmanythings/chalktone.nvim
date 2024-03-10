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
		ColorColumn = { link = "CursorColumn" },
		Conceal = { link = "Comment" },
		CurSearch = { fg = p.fg_main, bg = p.select_hl, bold = true, italic = false },
		Cursor = { fg = p.bg_main, bg = p.fg_main },
		CursorColumn = { link = "CursorColumn" },
		CursorIM = { link = "Cursor" },
		CursorLine = { bg = p.cursorline },
		CursorLineNr = { fg = p.statement },
		DiffAdd = { fg = p.ok },
		DiffChange = { fg = p.warn },
		DiffDelete = { fg = p.error_light },
		Directory = { link = "String" },
		EndOfBuffer = { link = "NonText" },
		ErrorMsg = { bg = p.error_dark },
		FloatBorder = { link = "NormalFloat" },
		FloatTitle = { link = "Normal" },
		FoldColumn = {},
		Folded = {},
		IncSearch = { link = "CurSearch" },
		LineNr = { fg = p.ui_accent },
		MatchParen = { bg = p.select_hl },
		ModeMsg = { link = "Normal" },
		MoreMsg = { link = "Normal" },
		NonText = { fg = p.bg_main, bg = p.bg_main },
		Normal = { fg = p.fg_main, bg = p.bg_main },
		NormalFloat = { bg = p.bg_main },
		NormalNC = { fg = p.fg_main, bg = p.bg_washed },
		-- NvimInternalError = { link = "ErrorMsg" },
		Pmenu = { link = "NormalFloat" },
		PmenuExtra = {},
		PmenuExtraSel = {},
		PmenuKind = {},
		PmenuKindSel = {},
		PmenuSbar = { link = "Pmenu" },
		PmenuThumb = { link = "PmenuSel" },
		PmenuSel = { link = "Visual" },
		Question = {},
		QuickFixLink = {},
		Search = { link = "CurSearch" },
		SignColumn = { bg = p.bg_main },
		SignColumnSB = { link = "SignColumn" },
		SpecialKey = {},
		SpellBad = {},
		SpellCap = {},
		SpellLocal = {},
		SpellRare = {},
		-- StatusLine = {},
		-- StatusLineNC = {},
		-- StatusLineTerm = {},
		-- StatusLineTermNC = {},
		Substitute = { link = "IncSearch" },
		TabLine = {},
		TabLineFill = {},
		TabLineSel = {},
		Title = { link = "CursorLineNr" },
		VertSplit = {},
		Visual = { bg = p.select_hl },
		WarningMsg = { bg = p.warn },
		WildMenu = { bg = p.comments },
		WinBar = {},
		WinBarNC = {},
		WinSeparator = { fg = p.ui_accent },

		DiagnosticError = { link = "ErrorMsg" },
		DiagnosticHint = { fg = p.hint, bg = p.bg_main },
		DiagnosticInfo = { fg = p.info, bg = p.bg_main },
		DiagnosticWarn = { link = "WarningMsg" },
		DiagnosticDefaultError = { link = "DiagnosticError" },
		DiagnosticDefaultHint = { link = "DiagnosticHint" },
		DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
		DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		-----------------------------------
		--            SYNTAX             --
		-----------------------------------
		Boolean = { link = "Number" },
		Character = { link = "String" },
		Comment = { fg = p.comments },
		Conditional = { link = "Keyword" },
		Constant = { fg = p.constant },
		-- Debug = {},
		-- Define = {},
		Delimiter = { fg = p.delimiter },
		Error = { link = "ErrorMsg" },
		Exception = { link = "Keyword" },
		Float = { link = "Number" },
		Function = { fg = p.warn },
		Identifier = { fg = p.fg_main },
		-- Include = {},
		Keyword = { link = "Statement" },
		-- Label = {},
		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		-- LspInlayHint = {},
		-- LspReferenceRead = {},
		-- LspReferenceText = {},
		-- LspReferenceWrite = {},
		-- Macro = {},
		Number = { fg = p.number },
		Operator = { fg = p.punctuation },
		-- PreCondit = {},
		PreProc = { fg = p.preproc },
		-- Repeat = {},
		Special = { fg = p.warn },
		-- SpecialChar = {},
		-- SpecialComment = {},
		Statement = { fg = p.statement },
		-- StorageClass = {},
		String = { fg = p.string },
		Structure = { link = "Type" },
		-- Tag = {},
		-- Todo = {},
		Type = { fg = p.type },
		TypeDef = { link = "Type" },

		Underlined = { underline = true }, -- ex html links
		Bold = { bold = true },
		Italic = { italic = true },

		------------------------------------
		--           TREESITTER           --
		------------------------------------
		["@annotation"] = { link = "PreProc" },
		["@attribute"] = { link = "PreProc" },
		["@boolean"] = { link = "Boolean" },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@comment"] = { link = "Comment" },
		["@keyword.conditional"] = { link = "Conditional" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Special" },
		["@constant.macro"] = { link = "Define" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.directive.define"] = { link = "Define" },
		["@keyword.exception"] = { link = "Exception" },
		["@number.float"] = { link = "Float" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Special" },
		["@function.call"] = { link = "@function" },
		["@function.macro"] = { link = "Macro" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.coroutine"] = { link = "@keyword" },
		["@keyword.operator"] = { link = "@operator" },
		["@keyword.return"] = { link = "@keyword" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.method" },
		["@namespace.builtin"] = { link = "@variable.builtin" },
		["@none"] = {},
		["@number"] = { link = "Number" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.storage"] = { link = "StorageClass" },
		["@string"] = { link = "String" },
		["@markup.link.label"] = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@tag"] = { link = "Label" },
		["@tag.attribute"] = { link = "@property" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@markup"] = { link = "@none" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "Type" },
		["@markup.raw"] = { link = "String" },
		["@markup.math"] = { link = "Special" },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Title" },
		["@comment.note"] = { fg = p.hint },
		["@comment.error"] = { fg = p.error_light },
		["@comment.hint"] = { fg = p.hint },
		["@comment.info"] = { fg = p.info },
		["@comment.warning"] = { fg = p.warn },
		["@comment.todo"] = { link = "Todo" },
		["@markup.link.url"] = { link = "Underlined" },
		["@type"] = { link = "Type" },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "@keyword" },

		------------------------------------
		--   LSP SEMANTIC TOKEN GROUPS    --
		------------------------------------
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.deriveHelper"] = { link = "@attribute" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
		["@lsp.type.generic"] = { link = "@variable" },
		-- ["@lsp.type.interface"] = { fg = util.lighten(c.blue1, 0.7) },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.lifetime"] = { link = "@keyword.storage" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		-- ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error },
		["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
		-- ["@lsp.typemod.type.defaultLibrary"] = { fg = util.darken(c.blue1, 0.8) },
		-- ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = util.darken(c.blue1, 0.8) },
		["@lsp.typemod.variable.callable"] = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		["@lsp.typemod.variable.static"] = { link = "@constant" },

		------------------------------------
		--          INTEGRATIONS          --
		------------------------------------

		-- GITSIGNS
		GitSignsAdd = { fg = p.ok },
		GitSignsChange = { fg = p.warn },
		GitSignsDelete = { fg = p.error_light },

		-- FLASH
		FlashBackdrop = { fg = p.comments, bg = p.black3, italic = false },
		FlashLabel = { fg = p.black3, bg = p.pop1, bold = false },
	}

	------------------------------------
	--         CMP HIGHLIGHTS         --
	------------------------------------
	local kinds = {
		Array = "@punctuation.bracket",
		Boolean = "@boolean",
		Class = "@type",
		Color = "Special",
		Constant = "@constant",
		Constructor = "@constructor",
		Enum = "@lsp.type.enum",
		EnumMember = "@lsp.type.enumMember",
		Event = "Special",
		Field = "@variable.member",
		File = "Normal",
		Folder = "Directory",
		Function = "@function",
		Interface = "@lsp.type.interface",
		Key = "@variable.member",
		Keyword = "@lsp.type.keyword",
		Method = "@function.method",
		Module = "@module",
		Namespace = "@module",
		Null = "@constant.builtin",
		Number = "@number",
		Object = "@constant",
		Operator = "@operator",
		Package = "@module",
		Property = "@property",
		Reference = "@markup.link",
		Snippet = "Conceal",
		String = "@string",
		Struct = "@lsp.type.struct",
		Unit = "@lsp.type.struct",
		Text = "@markup",
		TypeParameter = "@lsp.type.typeParameter",
		Variable = "@variable",
		Value = "@string",
	}

	local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
	for kind, link in pairs(kinds) do
		local base = "LspKind" .. kind
		highlights[base] = { link = link }
		for _, plugin in pairs(kind_groups) do
			highlights[plugin:format(kind)] = { link = base }
		end
	end

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
