local M = {}
---@alias Highlight table<string,string|boolean>

---@alias Theme table<string,Highlight> -- This should contain a highlight class, but not sure of the def for it yet

---@return Theme
M.setup = function()
	local config = require('chalktone.config')
	local by_group = config.options.format_by_group
	local theme_name = config.options.theme

	local p = require('chalktone.palettes').setup(theme_name)

	local highlights = {
		----------------------------------
		--            EDITOR            --
		----------------------------------
		-- stylua: ignore start
		ColorColumn         = { bg = p.cursorline },
		Conceal             = { fg = p.comments },
		CurSearch           = { fg = p.fg_main, bg = p.select_hl, bold = true, italic = false },
		Cursor              = { fg = p.bg_main, bg = p.fg_main },
		CursorColumn        = { bg = p.cursorline },
		CursorIM            = { fg = p.bg_main, bg = p.fg_main },
		CursorLine          = { bg = p.cursorline },
		CursorLineNr        = { fg = p.cursor_line_nr },
		DiffAdd             = { fg = p.ok },
		DiffChange          = { fg = p.warn },
		DiffDelete          = { fg = p.error_light },
		Directory           = { link = 'String' },
		EndOfBuffer         = { link = 'NonText' },
		ErrorMsg            = { fg = p.error_light },
		FloatBorder         = { link = 'NormalFloat' },
		FloatTitle          = { fg = p.fg_main, bg = p.bg_main },
		FoldColumn          = { bg = p.bg_washed},
		Folded              = { link = 'FoldColumn' },
		IncSearch           = { link = 'CurSearch' },
		LineNr              = { fg = p.ui_accent },
		MatchParen          = { bg = p.select_hl },
		ModeMsg             = { fg = p.fg_main, bg = p.bg_main },
		MoreMsg             = { fg = p.fg_main, bg = p.bg_main },
		NonText             = { fg = p.select_hl },
		Normal              = { fg = p.fg_main, bg = p.bg_main },
		NormalFloat         = { bg = p.bg_main },
		NormalNC            = { fg = p.fg_main, bg = p.bg_washed },
		NormalFloatNC       = { bg = p.bg_washed },
		NvimInternalError   = { fg = p.fg_main, bg = p.error_dark },
		Pmenu               = { link = 'NormalFloat' },
		PmenuExtra          = { link = 'Pmenu' },
		PmenuExtraSel       = { link = 'Visual' },
		PmenuKind           = { link = 'Pmenu' },
		PmenuKindSel        = { link = 'Visual' },
		PmenuSbar           = { link = 'Pmenu' },
		PmenuThumb          = { link = 'PmenuSel' },
		PmenuSel            = { link = 'Visual' },
		Question            = { fg = p.constant },
		QuickFixLink        = { fg = p.constant },
		Search              = { link = 'CurSearch' },
		SignColumn          = { bg = p.bg_main },
		SignColumnSB        = { link = 'SignColumn' },
		-- SpecialKey         = {},
		-- SpellBad           = {},
		-- SpellCap           = {},
		-- SpellLocal         = {},
		-- SpellRare          = {},
		-- StatusLine         = {},
		StatusLineNC        = { bg = p.bg_washed },
		-- StatusLineTerm     = {},
		-- StatusLineTermNC   = {},
		Substitute          = { link = 'IncSearch' },
		-- TabLine            = {},
		-- TabLineFill        = {},
		-- TabLineSel         = {},
		Title               = { fg = p.cursor_line_nr },
		-- VertSplit          = {},
		Visual              = { bg = p.select_hl },
		WarningMsg          = { fg = p.warn },
		WildMenu            = { bg = p.comments },
		-- WinBar             = {},
		-- WinBarNC           = {},
		WinSeparator        = { fg = p.ui_accent },

		-----------------------------------=
		--          DIAGNOSTICS           --
		-----------------------------------=
		DiagnosticError         = { fg = p.error_light },
		DiagnosticHint          = { fg = p.hint },
		DiagnosticInfo          = { fg = p.info },
		DiagnosticWarn          = { fg = p.warn },
		DiagnosticOK            = { fg = p.ok },

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

		DiagnosticUnnecessary   = { fg = p.hint }, -- unused/empty code

		------------------------------------
		--              SYNTAX            -- https://neovim.io/doc/user/syntax.html#highlight-groups
		------------------------------------
		Comment             = { fg = p.comments },
		Constant            = { fg = p.constant },
		String              = { fg = p.string },
		Character           = { fg = p.string },
		Number              = { fg = p.constant },
		Float               = { fg = p.constant },
		Boolean             = { fg = p.constant },

		Identifier          = { fg = p.fg_main },
		Function            = { fg = p.func },

		Keyword             = { fg = p.keyword },
		Statement           = { fg = p.keyword },
		Label               = { fg = p.keyword },
		Exception           = { fg = p.keyword },
		Conditional         = { fg = p.keyword },
		Repeat              = { fg = p.keyword },

		Operator            = { fg = p.operator },

		PreProc             = { fg = p.preproc },
		Include             = { fg = p.preproc },
		Define              = { fg = p.preproc },
		Macro               = { fg = p.preproc },
		PreCondit           = { fg = p.preproc },

		Type                = { fg = p.type },
		TypeDef             = { fg = p.type },
		StorageClass        = { fg = p.type },
		Structure           = { fg = p.type },

		Special             = { fg = p.delimiter },
		SpecialChar         = { link = 'Special' },
		SpecialComment      = { link = 'Special' },
		Tag                 = { fg = p.func },
		Delimiter           = { fg = p.delimiter },

		Underlined          = { underline = true }, -- ex html links
		Bold                = { bold = true },
		Italic              = { italic = true },

		Error               = { fg = p.error_light },
		Todo                = { fg = p.comments },
		Debug               = { fg = p.error_light },

		-- LspCodeLens            = {},
		-- LspCodeLensSeparator   = {},
		-- LspInlayHint           = {},
		-- LspReferenceRead       = {},
		-- LspReferenceText       = {},
		-- LspReferenceWrite      = {},

		------------------------------------
		--          TREESITTER           -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
		------------------------------------

		-- Identifiers
		['@variable']                   = { link = 'Identifier' }, -- various variable names
		['@variable.builtin']           = { link = 'Keyword' }, -- built-in variable names (e.g. `this`)
		['@variable.parameter']         = { fg = p.func_param }, -- parameters of a function
		['@variable.parameter.builtin'] = { fg = p.func_param }, -- special parameters (e.g. `_`, `it`)
		-- ['@variable.member']           = { fg = p.member }, -- object and struct fields

		['@constant']                   = { link = 'Constant' }, -- constant identifiers
		-- ['@constant.builtin']          = {}, -- built-in constant values
		['@constant.macro']             = { link = 'Constant' }, -- constants defined by the preprocessor

		['@module']                     = { fg = p.field }, -- modules or namespaces
		['@module.builtin']             = { link = '@module' }, -- built-in modules or namespaces
		-- ['@label']                     = {}, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

		-- Literals
		['@string']                     = { link = 'String' }, -- string literals
		-- ['@string.documentation']      = {}, -- string documenting code (e.g. Python docstrings)
		-- ['@string.regexp']             = {}, -- regular expressions
		-- ['@string.escape']             = {}, -- escape sequences
		-- ['@string.special']            = {}, -- other special strings (e.g. dates)
		-- ['@string.special.symbol']     = {}, -- symbols or atoms
		-- ['@string.special.url']        = {}, -- URIs (e.g. hyperlinks)
		-- ['@string.special.path']       = {}, -- filenames

		['@character']                  = { link = 'String' }, -- character literals
		-- ['@character.special']         = {}, -- special characters (e.g. wildcards)

		['@boolean']                    = { link = 'Boolean' }, -- boolean literals
		['@number']                     = { link = 'Number' }, -- numeric literals
		['@number.float']               = { link = 'Float' }, -- floating-point number literals

		-- Types
		['@type']                       = { link = 'Structure' }, -- type or class definitions and annotations
		['@type.builtin']               = { fg = p.field }, -- built-in types
		['@type.definition']            = { link = 'Type' }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
		-- ['@type.qualifier']            = { link = 'Keyword' }, -- type qualifiers (e.g. `const`)

		['@attribute']                  = { link = 'PreProc' }, -- attribute annotations (e.g. Python decorators)
		['@attribute.builtin']          = { link = 'PreProc' }, -- builtin annotations (e.g. `@property` in Python)
		-- ['@property']                  = { fg = p.member }, -- the key in key/value pairs

		-- Functions
		['@function']                   = { fg = p.func }, -- function definitions
		['@function.builtin']           = { fg = p.func }, -- built-in functions
		['@function.call']              = { fg = p.func }, -- function calls
		-- ['@function.macro']            = {}, -- preprocessor macros

		['@function.method']            = { fg = p.func }, -- method definitions
		['@function.method.call']       = { fg = p.func }, -- method calls

		['@constructor']                = { fg = p.func }, -- constructor calls and definitions
		['@constructor.lua']            = { fg = p.delimiter },
		['@operator']                   = { link = 'Operator' }, -- symbolic operators (e.g. `+` / `*`)

		-- Keywords
		['@keyword']                    = { link = 'Keyword' }, -- keywords not fitting into specific categories
		['@keyword.coroutine']          = { fg = p.field }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		['@keyword.function']           = { fg = p.field}, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		['@keyword.operator']           = { link = 'Operator' }, -- operators that are English words (e.g. `and` / `or`)
		['@keyword.import']             = { link = 'Include' }, -- keywords for including modules (e.g. `import` / `from` in Python)
		['@keyword.storage']            = { link = 'StorageClass' }, -- modifiers that affect storage in memory or life-time
		['@keyword.type']               = { link = 'Structure' }, -- keywords describing composite types (e.g. `struct`, `enum`)
		['@keyword.repeat']             = { link = 'Repeat' }, -- keywords related to loops (e.g. `for` / `while`)
		['@keyword.return']             = { link = 'Keyword' }, -- keywords like `return` and `yield`
		-- ['@keyword.debug']             = {}, -- keywords related to debugging
		['@keyword.exception']          = { link = 'Exception' }, -- keywords related to exceptions (e.g. `throw` / `catch`)

		['@keyword.conditional']        = { fg = p.keyword }, -- keywords related to conditionals (e.g. `if` / `else`)
		-- ['@keyword.conditional.ternary'] = { link = 'Operator' }, -- ternary operator (e.g. `?` / `:`)

		['@keyword.directive']          = { fg = p.preproc }, -- various preprocessor directives & shebangs
		['@keyword.directive.define']   = { fg = p.preproc }, -- preprocessor definition directives

		-- Punctuation
		-- ['@punctuation.delimiter']     = { link = 'Delimiter' }, -- delimiters (e.g. `;` / `.` / `,`)
		-- ['@punctuation.bracket']       = { fg = p.russet }, -- brackets (e.g. `()` / `{}` / `[]`)
		-- ['@punctuation.special']       = { link = 'Special' }, -- special symbols (e.g. `{}` in string interpolation)

		-- Comments
		['@comment']                    = { link = 'Comment' }, -- line and block comments
		-- ['@comment.documentation']     = {}, -- comments documenting code

		['@comment.error']              = { fg = p.error_light }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
		['@comment.warning']            = { fg = p.warn }, -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
		['@comment.todo']               = { fg = p.hint }, -- todo-type comments (e.g. `TODO`, `WIP`)
		['@comment.note']               = { fg = p.info }, -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

		-- TODO: Implement markup!

		-- -- Markup
		['@markup.strong']		    			= { link = 'Bold' }, -- bold text
		['@markup.italic']		    			= { link = 'Italic' }, -- italic text
		['@markup.strikethrough'] 			= { strikethrough = true }, -- struck-through text
		['@markup.underline']           = { link = 'Underlined' }, -- underlined text (only for literal underline markup!)

		['@markup.heading']             = { fg = p.header1 }, -- headings, titles (including markers)
		-- ['@markup.heading.1']          = { fg = p.header1 }, -- top-level heading
		-- ['@markup.heading.2']          = { fg = p.header2 }, -- section heading
		-- ['@markup.heading.3']          = { fg = p.header3 }, -- subsection heading
		-- ['@markup.heading.4']          = { fg = p.header4 }, -- and so on
		-- ['@markup.heading.5']          = { fg = p.header5 }, -- and so forth
		-- ['@markup.heading.6']          = { fg = p.header6 }, -- six levels ought to be enough for anybody
		--
		-- ['@markup.quote']              = {}, -- block quotes
		-- ['@markup.math']               = {}, -- math environments (e.g. `$ ... $` in LaTeX)
		--
		['@markup.link']                = { underline = false }, -- text references, footnotes, citations, etc.
		['@markup.link.label']          = { fg = p.preproc }, -- link, reference descriptions
		['@markup.link.url']            = { fg = p.string }, -- URL-style links
		--
		['@markup.raw']                 = { fg = p.fg_main }, -- literal or verbatim text (e.g. inline code)
		['@markup.raw.block']           = { fg = p.fg_main }, -- literal or verbatim text as a stand-alone block
		-- -- (use priority 90 for blocks with injections)
		--
		-- ['@markup.list']               = {}, -- list markers
		-- ['@markup.list.checked']       = {}, -- checked todo-style list markers
		-- ['@markup.list.unchecked']     = {}, -- unchecked todo-style list markers

		['@diff.plus']                  = { link = 'DiffAdd' }, -- added text (for diff files)
		['@diff.minus']                 = { link = 'DiffDelete' }, -- deleted text (for diff files)
		['@diff.delta']                 = { link = 'DiffChange'}, -- changed text (for diff files)

		-- -- Non-highlighting captures
		-- ['@none']                      = {}, -- completely disable the highlight
		-- ['@conceal']                   = {}, -- captures that are only meant to be concealed
		--
		-- ['@spell']                     = {}, -- for defining regions to be spellchecked
		-- ['@nospell']                   = {}, -- for defining regions that should NOT be spellchecked

		-- LEGACY  TODO: Remove with v10

		['@parameter']                  = { link = '@variable.parameter' },
		['@field']                      = { link = '@variable.member' },
		['@namespace']                  = { link = '@module' },
		['@float']                      = { link = '@number.float' },
		['@symbol']                     = { link = '@string.special.symbol' },
		['@string.regex']               = { link = '@string.regexp' },

		['@text']                       = { link = '@markup' },
		['@text.strong']                = { link = '@markup.strong' },
		['@text.emphasis']              = { link = '@markup.italic' },
		['@text.underline']             = { link = '@markup.underline' },
		['@text.strike']                = { link = '@markup.strikethrough' },
		['@text.uri']                   = { link = '@markup.link.url' },
		['@text.math']                  = { link = '@markup.math' },
		['@text.environment']           = { link = '@markup.environment' },
		['@text.environment.name']      = { link = '@markup.environment.name' },

		['@text.title']                 = { link = '@markup.heading' },
		['@text.literal']               = { link = '@markup.raw' },
		['@text.reference']             = { link = '@markup.link' },

		['@text.todo.checked']          = { link = '@markup.list.checked' },
		['@text.todo.unchecked']        = { link = '@markup.list.unchecked' },

		-- @text.todo is now for todo comments, not todo notes like in markdown
		['@text.todo']                  = { link = '@comment.todo' },
		['@text.warning']               = { link = '@comment.warning' },
		['@text.note']                  = { link = '@comment.note' },
		['@text.danger']                = { link = '@comment.error' },

		-- @text.uri is now
		-- > @markup.link.url in markup links
		-- > @string.special.url outside of markup
		-- ['@text.uri'] = { link = '@markup.link.uri' },

		['@method']                     = { link = '@function.method' },
		['@method.call']                = { link = '@function.method.call' },

		['@text.diff.add']              = { link = '@diff.plus' },
		['@text.diff.delete']           = { link = '@diff.minus' },

		['@define']                     = { link = '@keyword.directive.define' },
		['@preproc']                    = { link = '@keyword.directive' },
		['@storageclass']               = { link = '@keyword.storage' },
		['@conditional']                = { link = '@keyword.conditional' },
		['@exception']                  = { link = '@keyword.exception' },
		['@include']                    = { link = '@keyword.import' },
		['@repeat']                     = { link = '@keyword.repeat' },

		['@variable.member.yaml']       = { link = '@field.yaml' },

		['@text.title.1.markdown']      = { link = '@markup.heading.1.markdown' },
		['@text.title.2.markdown']      = { link = '@markup.heading.2.markdown' },
		['@text.title.3.markdown']      = { link = '@markup.heading.3.markdown' },
		['@text.title.4.markdown']      = { link = '@markup.heading.4.markdown' },
		['@text.title.5.markdown']      = { link = '@markup.heading.5.markdown' },
		['@text.title.6.markdown']      = { link = '@markup.heading.6.markdown' },

		------------------------------------
		--    LSP SEMANTIC TOKEN GROUPS   -- https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight
		------------------------------------
		['@lsp.type.enum']                        = { link = '@type' },
		['@lsp.type.variable']                    = { link = 'Identifier' },
		['@lsp.type.parameter']                   = { link = '@variable.parameter' },
		['@lsp.type.namespace']                   = { fg = p.field },
		['@lsp.typemod.type.defaultLibrary']      = { fg = p.field },
		['@lsp.typemod.function.defaultLibrary']  = { fg = p.func },

		------------------------------------
		--          CMP HIGHLIGHTS        --
		------------------------------------
		CmpDocumentation            = { link = 'Normal' },
		CmpDocumentationBorder      = { link = 'Normal' },

		CmpItemAbbr                 = { fg = p.comments },
		CmpItemAbbrDeprecated       = { fg = p.ui_accent, italic = true },
		CmpItemAbbrMatch            = { fg = p.fg_main },
		CmpItemAbbrMatchFuzzy       = { fg = p.fg_main },

		CmpItemKindDefault          = { fg = p.fg_main },
		CmpItemMenu                 = { fg = p.comments },

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
		GitSignsAdd       = { fg = p.ok },
		GitSignsChange    = { fg = p.warn },
		GitSignsDelete    = { fg = p.error_light },

		-------------------------------------
		--              FLASH              --
		-------------------------------------
		FlashBackdrop     = { fg = p.comments, bg = '#000000', italic = false },
		FlashLabel        = { fg = p.bg_main, bg = p.pop1, bold = false },

		------------------------------------
		--            WHICHKEY            -- 
		------------------------------------
		-- WhichKey           = {}, -- the key
		-- WhichKeyGroup      = {}, -- a group
		-- WhichKeySeparator  = {}, -- the sparator between the key and its label
		-- WhichKeyDesc       = {}, -- the label of the key
		WhichKeyFloat       = { bg = p.bg_washed }, -- normal in the popup window
		-- WhichKeyBorder     = {}, -- normal in the popup window
		-- WhichKeyValue      = {}, -- used by plugins that provide values

		------------------------------------
		--              LAZY              --
		------------------------------------
		-- LazyButton           = { 'CursorLine' },
		-- LazyButtonActive     = { 'Visual' },
		-- LazyComment          = { 'Comment' },
		-- LazyCommit           = { '@variable.builtin' }, -- commit ref
		-- LazyCommitIssue      = { 'Number' },
		-- LazyCommitScope      = { 'Italic' }, -- conventional commit scope
		-- LazyCommitType       = { 'Title' }, -- conventional commit type
		-- LazyDimmed           = { 'Conceal' }, -- property
		-- LazyDir              = { '@markup.link' }, -- directory
		-- LazyH1               = { 'IncSearch' }, -- home button
		-- LazyH2               = { 'Bold' }, -- titles
		-- LazyLocal            = { 'Constant' },
		-- LazyNoCond           = { 'DiagnosticWarn' }, -- unloaded icon for a plugin where cond() was false
		-- LazyNormal           = { 'NormalFloat' },
		-- LazyProgressDone     = { 'Constant' }, -- progress bar done
		-- LazyProgressTodo     = { 'LineNr' }, -- progress bar todo
		LazyProp              = { fg = p.type }, -- property
		-- LazyReasonCmd        = { 'Operator' },
		-- LazyReasonEvent      = { 'Constant' },
		-- LazyReasonFt         = { 'Character' },
		LazyReasonImport      = { fg = p.func_param },
		LazyReasonKeys        = { fg = p.func },
		LazyReasonPlugin      = { fg = p.type },
		-- LazyReasonRequire    = { '@variable.parameter' },
		LazyReasonRuntime     = { fg = p.comments },
		LazyReasonSource      = { fg = p.string },
		LazyReasonStart       = { fg = p.func },
		-- LazySpecial          = { '@punctuation.special' },
		-- LazyTaskError        = { 'ErrorMsg' }, -- task errors
		-- LazyTaskOutput       = { 'MsgArea' }, -- task output
		-- LazyUrl              = { '@markup.link' }, -- url
		-- LazyValue            = { '@string' }, -- value of a property

		------------------------------------
		--              NEORG             --
		------------------------------------
		['@neorg.headings.1.title']   = { fg = p.header1 },
		['@neorg.headings.2.title']   = { fg = p.header2 },
		['@neorg.headings.3.title']   = { fg = p.header3 },
		['@neorg.headings.4.title']   = { fg = p.header4 },
		['@neorg.headings.5.title']   = { fg = p.header5 },
		['@neorg.headings.6.title']   = { fg = p.header6 },
		['@neorg.headings.1.prefix']  = { link = 'Identifier' },
		['@neorg.headings.2.prefix']  = { link = 'Identifier' },
		['@neorg.headings.3.prefix']  = { link = 'Identifier' },
		['@neorg.headings.4.prefix']  = { link = 'Identifier' },
		['@neorg.headings.5.prefix']  = { link = 'Identifier' },
		['@neorg.headings.6.prefix']  = { link = 'Identifier' },

		-- ['@neorg.links.location.heading.1'] = {},
		-- ['@neorg.links.location.heading.2'] = {},
		-- ['@neorg.links.location.heading.3'] = {},
		-- ['@neorg.links.location.heading.4'] = {},
		-- ['@neorg.links.location.heading.5'] = {},
		-- ['@neorg.links.location.heading.6'] = {},
		--
		['@neorg.todo_items.undone']    = { fg = p.delimiter },
		['@neorg.todo_items.done']      = { fg = p.func },
		['@neorg.todo_items.on_hold']   = { fg = p.ui_accent },
		['@neorg.todo_items.cancelled'] = { fg = p.comments },
		['@neorg.todo_items.uncertain'] = { fg = p.string },
		['@neorg.todo_items.pending']   = { fg = p.field },
		['@neorg.todo_items.recurring'] = { fg = p.preproc },
		['@neorg.todo_items.urgent']    = { fg = p.operator },
		-- ['@neorg.lists.unordered.prefix'] = {},
		-- ['@neorg.lists.ordered.prefix'] = {},
		--
		-- ['@neorg.markup.verbatim'] = {},
		['@neorg.tags.ranged_verbatim.name.norg'] = { fg = p.keyword },
		-- ['@neorg.links'] = {},
		-- ['@neorg.links.file'] = {},
		['@neorg.links.description']  = { fg = p.preproc },
		--
		-- ['@neorg.delimiters.horizontal_line'] = {},

		-- stylua: ignore end
	}

	highlights = M._apply_raw_formatting(highlights, by_group)

	return highlights
end

M._apply_raw_formatting = function(highlights, styling)
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
	blend         = true, -- integer between 0 and 100
	bold          = true, -- boolean
	standout      = true, -- boolean
	underline     = true, -- boolean
	undercurl     = true, -- boolean
	underdouble   = true, -- boolean
	underdotted   = true, -- boolean
	underdashed   = true, -- boolean
	strikethrough = true, -- boolean
	italic        = true, -- boolean
	reverse       = true, -- boolean
	nocombine     = true, -- boolean
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
