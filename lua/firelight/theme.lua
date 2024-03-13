local M = {}
---@alias Highlight table<string,string|boolean>

---@alias Theme table<string,Highlight> -- This should contain a highlight class, but not sure of the def for it yet

---@return Theme
M.setup = function()
	local config = require('firelight.config')
	local styling = config.options.formatting
	local palette_name = config.options.palette_name

	local p = require('firelight.palettes').setup(palette_name)

	local highlights = {
		-----------------------------------
		--            EDITOR             --
		-----------------------------------
    -- stylua: ignore start
		ColorColumn         = { link = "CursorLine" },
		Conceal             = { link = 'Comment' },
		CurSearch           = { fg = p.fg_main, bg = p.select_hl, bold = true, italic = false },
		Cursor              = { fg = p.bg_main, bg = p.fg_main },
		CursorColumn        = { link = 'CursorLine' },
		CursorIM            = { link = 'Cursor' },
		CursorLine          = { bg = p.cursorline },
		CursorLineNr        = { fg = p.carrot_orange },
		DiffAdd             = { fg = p.ok },
		DiffChange          = { fg = p.warn },
		DiffDelete          = { fg = p.error_light },
		Directory           = { link = 'String' },
		EndOfBuffer         = { link = 'NonText' },
		ErrorMsg            = { fg = p.error_light },
		FloatBorder         = { link = 'NormalFloat' },
		FloatTitle          = { link = 'Normal' },
		FoldColumn          = { bg = p.bg_washed},
		Folded              = { link = 'FoldColumn' },
		IncSearch           = { link = 'CurSearch' },
		LineNr              = { fg = p.ui_accent },
		MatchParen          = { bg = p.select_hl },
		ModeMsg             = { link = 'Normal' },
		MoreMsg             = { link = 'Normal' },
		-- NonText             = { fg = p.bg_main, bg = p.bg_main },
		Normal              = { fg = p.fg_main, bg = p.bg_main },
		NormalFloat         = { bg = p.bg_main },
		NormalNC            = { fg = p.fg_main, bg = p.bg_washed },
		NvimInternalError   = { fg = p.fg_main, bg = p.error_dark },
		Pmenu               = { link = 'NormalFloat' },
		PmenuExtra          = { link = 'Pmenu' },
		PmenuExtraSel       = { link = 'Visual' },
		PmenuKind           = { link = 'Pmenu' },
		PmenuKindSel        = { link = 'Visual' },
		PmenuSbar           = { link = 'Pmenu' },
		PmenuThumb          = { link = 'PmenuSel' },
		PmenuSel            = { link = 'Visual' },
		-- Question            = {},
		-- QuickFixLink        = {},
		Search              = { link = 'CurSearch' },
		SignColumn          = { bg = p.bg_main },
		SignColumnSB        = { link = 'SignColumn' },
		-- SpecialKey          = {},
		-- SpellBad            = {},
		-- SpellCap            = {},
		-- SpellLocal          = {},
		-- SpellRare           = {},
		-- StatusLine          = {},
		StatusLineNC        = { bg = p.bg_washed },
		-- StatusLineTerm      = {},
		-- StatusLineTermNC    = {},
		Substitute          = { link = 'IncSearch' },
		-- TabLine             = {},
		-- TabLineFill         = {},
		-- TabLineSel          = {},
		Title               = { link = 'CursorLineNr' },
		-- VertSplit           = {},
		Visual              = { bg = p.select_hl },
		WarningMsg          = { fg = p.warn },
		WildMenu            = { bg = p.comments },
		-- WinBar              = {},
		-- WinBarNC            = {},
		WinSeparator        = { fg = p.ui_accent },

		-----------------------------------
		--         DIAGNOSTICS           --
		-----------------------------------
		DiagnosticError     		= { fg = p.error_light },
		DiagnosticHint      		= { fg = p.hint },
		DiagnosticInfo      		= { fg = p.info },
		DiagnosticWarn      		= { fg = p.warn },
		DiagnosticOK        		= { fg = p.ok },

		DiagnosticFloatingError = { link = 'DiagnosticError' },
		DiagnosticFloatingHint  = { link = 'DiagnosticHint' },
		DiagnosticFloatingInfo  = { link = 'DiagnosticInfo' },
		DiagnosticFloatingWarn  = { link = 'DiagnosticWarn' },
		DiagnosticFloatingOk    = { link = 'DiagnosticOK' },

		DiagnosticSignError     = { link = 'DiagnosticError' },
		DiagnosticSignHint      = { link = 'DiagnosticHint' },
		DiagnosticSignInfo      = { link = 'DiagnosticInfo' },
		DiagnosticSignWarn      = { link = 'DiagnosticWarn' },
		DiagnosticSignOk        = { link = 'DiagnosticOK' },

		-----------------------------------
		--            SYNTAX             -- https://neovim.io/doc/user/syntax.html#highlight-groups
		-----------------------------------
		Comment             = { fg = p.comments },
		Constant            = { fg = p.constant },
		String              = { fg = p.string, italic = true },
		Character           = { link = 'String' },
		Number              = { fg = p.constant },
		Float               = { link = 'Number' },
		Boolean             = { link = 'Number' },

		Identifier          = { fg = p.fg_main },
		Function            = { fg = p.func },

		Keyword             = { fg = p.keyword },
		Statement           = { link = 'Keyword' },
		Label               = { link = 'Keyword' },
		Exception           = { link = 'Keyword' },
		Conditional         = { link = 'Keyword' },
		Repeat              = { link = 'Keyword' },

		Operator            = { fg = p.operator },

		PreProc             = { fg = p.preproc },
		Include             = { link = 'PreProc' },
		Define              = { link = 'PreProc' },
		Macro               = { link = 'PreProc' },
		PreCondit           = { link = 'PreProc' },

		Type                = { fg = p.type },
		TypeDef             = { link = 'Type' },
		StorageClass        = { link = 'Type' },
		Structure           = { link = 'Type' },

		Special             = { fg = p.delimiter },
		SpecialChar         = { link = 'Special' },
		SpecialComment      = { link = 'Special' },
		Tag                 = { link = 'Function' },
		Delimiter           = { fg = p.delimiter },

		Underlined          = { underline = true }, -- ex html links
		Bold                = { bold = true },
		Italic              = { italic = true },

		Error               = { link = 'ErrorMsg' },
		Todo                = { fg = p.comments },
		Debug               = { link = 'Error' },

		-- LspCodeLens = {},
		-- LspCodeLensSeparator = {},
		-- LspInlayHint = {},
		-- LspReferenceRead = {},
		-- LspReferenceText = {},
		-- LspReferenceWrite = {},

		------------------------------------
		--           TREESITTER           -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
		------------------------------------

		-- Identifiers
		['@variable']                   = { link = 'Identifiers' }, -- various variable names
		['@variable.builtin']           = { link = 'Keyword' }, -- built-in variable names (e.g. `this`)
		-- ['@variable.parameter']         = { fg = p.preproc }, -- parameters of a function
		-- ['@variable.parameter.builtin'] = {}, -- special parameters (e.g. `_`, `it`)
		-- ['@variable.member']            = { fg = p.jasmine }, -- object and struct fields

		['@constant']         					= { link = 'Constant' }, -- constant identifiers
		-- ['@constant.builtin'] 					= {}, -- built-in constant values
		['@constant.macro']   					= { link = 'Constant' }, -- constants defined by the preprocessor

		['@module']         						= { fg = p.jasmine }, -- modules or namespaces
		['@module.builtin'] 						= { link = '@module' }, -- built-in modules or namespaces
		-- ['@label']          						= {}, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

		-- Literals
		['@string']                 		= { link = 'String' }, -- string literals
		-- ['@string.documentation']   		= {}, -- string documenting code (e.g. Python docstrings)
		-- ['@string.regexp']          		= {}, -- regular expressions
		-- ['@string.escape']          		= {}, -- escape sequences
		-- ['@string.special']         		= {}, -- other special strings (e.g. dates)
		-- ['@string.special.symbol']  		= {}, -- symbols or atoms
		-- ['@string.special.url']     		= {}, -- URIs (e.g. hyperlinks)
		-- ['@string.special.path']    		= {}, -- filenames

		['@character']                  = { link = 'String' }, -- character literals
		-- ['@character.special']          = {}, -- special characters (e.g. wildcards)

		['@boolean']                    = { link = 'Number' }, -- boolean literals
		['@number']                     = { link = 'Number' }, -- numeric literals
		['@number.float']               = { link = 'Number' }, -- floating-point number literals

		-- Types
		['@type']             					= { link = 'Structure' }, -- type or class definitions and annotations
		['@type.builtin']     					= { fg = p.jasmine }, -- built-in types
		['@type.definition']  					= { link = 'Type' }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
		-- ['@type.qualifier']   					= { link = 'Keyword' }, -- type qualifiers (e.g. `const`)

		['@attribute']                  = { link = 'PreProc' }, -- attribute annotations (e.g. Python decorators)
		['@attribute.builtin']          = { link = 'PreProc' }, -- builtin annotations (e.g. `@property` in Python)
		-- ['@property']                   = {}, -- the key in key/value pairs

		-- Functions
		['@function']         					= { fg = p.func }, -- function definitions
		['@function.builtin'] 					= { fg = p.func }, -- built-in functions
		['@function.call']    					= { link = '@function' }, -- function calls
		-- ['@function.macro']   					= {}, -- preprocessor macros

		['@function.method']            = { fg = p.func}, -- method definitions
		['@function.method.call']       = { link = '@function.method' }, -- method calls

		['@constructor']                = { link = 'Function' }, -- constructor calls and definitions
    ['@constructor.lua']            = { link = 'Delimiter' },
		['@operator']                   = { link = 'Operator' }, -- symbolic operators (e.g. `+` / `*`)

		-- Keywords
		['@keyword']            				= { link = 'Keyword' }, -- keywords not fitting into specific categories
		['@keyword.coroutine']  				= { fg = p.jasmine }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		['@keyword.function']   				= { fg = p.jasmine}, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		['@keyword.operator']   				= { link = 'Operator' }, -- operators that are English words (e.g. `and` / `or`)
		['@keyword.import']     				= { link = 'Include' }, -- keywords for including modules (e.g. `import` / `from` in Python)
		['@keyword.storage']    				= { link = 'StorageClass' }, -- modifiers that affect storage in memory or life-time
		['@keyword.type']       				= { link = 'Structure' }, -- keywords describing composite types (e.g. `struct`, `enum`)
		['@keyword.repeat']     				= { link = 'Repeat' }, -- keywords related to loops (e.g. `for` / `while`)
		['@keyword.return']     				= { link = 'Keyword' }, -- keywords like `return` and `yield`
		-- ['@keyword.debug']      				= {}, -- keywords related to debugging
		['@keyword.exception']  				= { link = 'Exception' }, -- keywords related to exceptions (e.g. `throw` / `catch`)

		['@keyword.conditional']         = { link = 'Keyword' }, -- keywords related to conditionals (e.g. `if` / `else`)
		-- ['@keyword.conditional.ternary'] = { link = 'Operator' }, -- ternary operator (e.g. `?` / `:`)

		['@keyword.directive']          = { link = 'PreProc' }, -- various preprocessor directives & shebangs
		['@keyword.directive.define']   = { link = 'Define' }, -- preprocessor definition directives

		-- Punctuation
		-- ['@punctuation.delimiter']      = { link = 'Delimiter' }, -- delimiters (e.g. `;` / `.` / `,`)
		-- ['@punctuation.bracket']        = { fg = p.russet }, -- brackets (e.g. `()` / `{}` / `[]`)
		-- ['@punctuation.special']        = { link = 'Special' }, -- special symbols (e.g. `{}` in string interpolation)

		-- Comments
		['@comment']                    = { link = 'Comment' }, -- line and block comments
		-- ['@comment.documentation']      = {}, -- comments documenting code

		['@comment.error']              = { link = 'ErrorMsg' }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
		['@comment.warning']            = { link = 'WarningMsg' }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
		['@comment.todo']               = { fg = p.hint }, -- todo-type comments (e.g. `TODO`, `WIP`)
		['@comment.note']               = { fg = p.info }, -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

    -- TODO: Implement markup!

		-- -- Markup
		-- ['@markup.strong']        			= {}, -- bold text
		-- ['@markup.italic']        			= {}, -- italic text
		-- ['@markup.strikethrough'] 			= {}, -- struck-through text
		-- ['@markup.underline']     			= {}, -- underlined text (only for literal underline markup!)
		--
		-- ['@markup.heading']   					= {}, -- headings, titles (including markers)
		-- ['@markup.heading.1'] 					= {}, -- top-level heading
		-- ['@markup.heading.2'] 					= {}, -- section heading
		-- ['@markup.heading.3'] 					= {}, -- subsection heading
		-- ['@markup.heading.4'] 					= {}, -- and so on
		-- ['@markup.heading.5'] 					= {}, -- and so forth
		-- ['@markup.heading.6'] 					= {}, -- six levels ought to be enough for anybody
		--
		-- ['@markup.quote']               = {}, -- block quotes
		-- ['@markup.math']                = {}, -- math environments (e.g. `$ ... $` in LaTeX)
		--
		-- ['@markup.link']        				= {}, -- text references, footnotes, citations, etc.
		-- ['@markup.link.label']  				= {}, -- link, reference descriptions
		-- ['@markup.link.url']    				= {}, -- URL-style links
		--
		-- ['@markup.raw']         				= {}, -- literal or verbatim text (e.g. inline code)
		-- ['@markup.raw.block']   				= {}, -- literal or verbatim text as a stand-alone block
		-- -- (use priority 90 for blocks with injections)
		--
		-- ['@markup.list']                = {}, -- list markers
		-- ['@markup.list.checked']        = {}, -- checked todo-style list markers
		-- ['@markup.list.unchecked']      = {}, -- unchecked todo-style list markers

		['@diff.plus']                  = { link = 'DiffAdd' }, -- added text (for diff files)
		['@diff.minus']                 = { link = 'DiffDelete' }, -- deleted text (for diff files)
		['@diff.delta']                 = { link = 'DiffChange'}, -- changed text (for diff files)

		-- -- Non-highlighting captures
		-- ['@none']     									= {}, -- completely disable the highlight
		-- ['@conceal']  									= {}, -- captures that are only meant to be concealed
		--
		-- ['@spell']    									= {}, -- for defining regions to be spellchecked
		-- ['@nospell']  									= {}, -- for defining regions that should NOT be spellchecked

		------------------------------------
		--   LSP SEMANTIC TOKEN GROUPS    -- https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight
		------------------------------------

		['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.variable'] = { link = 'Identifier' },
    -- ['@lsp.typemod.property'] = { fg = p.jasmine },

		------------------------------------
		--         CMP HIGHLIGHTS         --
		------------------------------------
		CmpDocumentation            = { link = 'Normal' },
		CmpDocumentationBorder      = { link = 'CmpDocumentationBorder' },

		CmpItemAbbr                 = { fg = p.comments },
		CmpItemAbbrDeprecated       = { fg = p.ui_accent, italic = true },
		CmpItemAbbrMatch            = { fg = p.fg_main },
		CmpItemAbbrMatchFuzzy       = { fg = p.fg_main },

		CmpItemKindDefault          = { fg = p.fg_main },
		CmpItemMenu                 = { link = 'Comment' },

		CmpItemKindKeyword          = { link = 'Identifier' },

		CmpItemKindVariable         = { link = '@variable' },
		CmpItemKindConstant         = { link = 'Constant' },
		CmpItemKindReference        = { link = 'Keyword' },
		CmpItemKindValue            = { link = 'Keyword' },

		CmpItemKindFunction         = { link = 'Function' },
		CmpItemKindMethod           = { link = 'Function' },
		CmpItemKindConstructor      = { link = 'Function' },

		CmpItemKindInterface        = { link = 'Constant' },
		CmpItemKindEvent            = { link = 'Constant' },
		CmpItemKindEnum             = { link = 'Constant' },
		CmpItemKindUnit             = { link = 'Constant' },

		CmpItemKindClass            = { link = 'Type' },
		CmpItemKindStruct           = { link = 'Type' },

		CmpItemKindModule           = { link = 'Identifier' },

		CmpItemKindProperty         = { link = '@property' },
		CmpItemKindField            = { link = '@field' },
		CmpItemKindTypeParameter    = { link = '@field' },
		CmpItemKindEnumMember       = { link = '@field' },
		CmpItemKindOperator         = { link = 'Operator' },
		CmpItemKindSnippet          = { fg = p.preproc },

		------------------------------------
		--            GITSIGNS            --
		------------------------------------
		GitSignsAdd     = { fg = p.ok },
		GitSignsChange  = { fg = p.warn },
		GitSignsDelete  = { fg = p.error_light },

		------------------------------------
		--             FLASH              --
		------------------------------------
		FlashBackdrop = { fg = p.comments, bg = p.black, italic = false },
		FlashLabel    = { fg = p.black, bg = p.pop1, bold = false },
		-- stylua: ignore end
	}

	highlights = M._apply_styling(styling, highlights)

	return highlights
end

M._apply_styling = function(styling, highlights)
	if type(styling) ~= 'table' then
		-- assert(1 == 0, "Something other than a table was passed to _apply_styling")
		return highlights
	end

	for _, style in pairs(styling) do
		style = M._sanitize_style(style)
	end

	return vim.tbl_deep_extend('force', highlights, styling)
end

M._sanitize_style = function(style)
	for attr_name, _ in pairs(style) do
		if not M._validate_hl_attr(attr_name) then
			style[attr_name] = nil
		end
	end
	return style
end

local _valid_attr_names = { -- :h nvim_set_hl
  -- stylua: ignore start
	fg            = true, -- color name or "#RRGGBB"
	bg            = true, -- color name or "#RRGGBB"
	sp            = true, -- color name or "#RRGGBB"
	blend         = false, -- integer between 0 and 100
	bold          = true, -- boolean
	standout      = false, -- boolean
	underline     = true, -- boolean
	undercurl     = true, -- boolean
	underdouble   = false, -- boolean
	underdotted   = false, -- boolean
	underdashed   = false, -- boolean
	strikethrough = true, -- boolean
	italic        = true, -- boolean
	reverse       = false, -- boolean
	nocombine     = false, -- boolean
	link          = true, -- name of another highlight group to link to. :hi-link
	-- stylua: ignore end
}

---validates the attr name as one the color scheme supports altering
---@param attr_name string
---@return boolean
M._validate_hl_attr = function(attr_name)
	return _valid_attr_names[attr_name] == true
end

return M
