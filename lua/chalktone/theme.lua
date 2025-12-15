local M = {}
---@alias Highlight table<string,string|boolean>

---@alias Theme table<string,Highlight> -- This should contain a highlight class, but not sure of the def for it yet

---@return Theme
M.setup = function()
    local config = require('chalktone.config').options
    local by_group = config.format_by_group
    local theme = config.theme
    local palette = config.palette

    local p = require('chalktone.palettes').setup(theme, palette)

    local highlights = {
        -- ========================================================================
        -- Editor :h highlight-groups
        -- ========================================================================
        ColorColumn = { bg = colors.cursorline },
        -- ComplHint = {},
        -- ComplHintMore = {},
        -- ComplMatchIns = {},
        Conceal = { fg = colors.comments },
        CurSearch = { fg = colors.fg_main, bg = colors.select_hl, bold = true, italic = false },
        Cursor = { fg = colors.bg_main, bg = colors.fg_main },
        CursorColumn = { bg = colors.cursorline },
        CursorIM = { fg = colors.bg_main, bg = colors.fg_main },
        CursorLine = { bg = colors.cursorline },
        -- CursorLineFold = {},
        CursorLineNr = { fg = colors.cursor_line_nr },
        -- CursorLineSign = {},
        DiffAdd = { fg = colors.ok },
        DiffChange = { fg = colors.warn },
        DiffDelete = { fg = colors.error_light },
        -- DiffText = {},
        -- DiffTextAdd = {},
        Directory = { fg = colors.string },
        EndOfBuffer = { link = "NonText" },
        ErrorMsg = { fg = colors.error_light },
        FloatBorder = { link = "NormalFloat" },
        -- FloatFooter = {},
        -- FloatShadow = {},
        -- FloatShadowThrough = {},
        FloatTitle = { fg = colors.fg_main, bg = colors.bg_main },
        FoldColumn = { bg = colors.bg_washed },
        Folded = { link = "FoldColumn" },
        IncSearch = { link = "CurSearch" },
        LineNr = { fg = colors.ui_accent },
        -- LineNrAbove = {},
        -- LineNrBelow = {},
        MatchParen = { bg = colors.select_hl },
        -- Menu = {},
        ModeMsg = { fg = colors.fg_main, bg = colors.bg_main },
        MoreMsg = { fg = colors.fg_main, bg = colors.bg_main },
        -- MsgArea = {},
        -- MsgSeparator = {},
        NonText = { fg = colors.select_hl },
        Normal = { fg = colors.fg_main, bg = colors.bg_main },
        NormalFloat = { bg = colors.bg_main },
        NormalFloatNC = { bg = colors.bg_washed },
        NormalNC = { fg = colors.fg_main, bg = colors.bg_washed },
        NvimInternalError = { fg = colors.fg_main, bg = colors.error_dark },
        -- OkMsg = {},
        Pmenu = { link = "NormalFloat" },
        -- PmenuBorder = {},
        PmenuExtra = { link = "Pmenu" },
        PmenuExtraSel = { link = "Visual" },
        PmenuKind = { link = "Pmenu" },
        PmenuKindSel = { link = "Visual" },
        -- PmenuMatch = {},
        -- PmenuMatchSel = {},
        PmenuSbar = { link = "Pmenu" },
        PmenuSel = { link = "Visual" },
        -- PmenuShadow = {},
        -- PmenuShadowThrough = {},
        PmenuThumb = { link = "PmenuSel" },
        -- PreInsert = {},
        Question = { fg = colors.constant },
        QuickFixLine = { link = "Search" },
        QuickFixLink = { fg = colors.constant },
        -- Scrollbar = {},
        Search = { link = "CurSearch" },
        SignColum = { bg = colors.bg_main },
        -- SignColumn = {},
        SignColumnS = { link = "SignColumn" },
        -- SnippetTabstop = {},
        -- SnippetTabstopActive = {},
        -- SpecialKey = {},
        -- SpellBad = {},
        -- SpellCap = {},
        -- SpellLocal = {},
        -- SpellRare = {},
        StatusLine = { fg = colors.bg_main, bg = colors.fg_main, bold = true },
        StatusLineNC = { bg = colors.select_hl },
        -- StatusLineTerm = {},
        -- StatusLineTermNC = {},
        -- StderrMsg = {},
        -- StdoutMsg = {},
        Substitute = { link = "IncSearch" },
        -- TabLine = {},
        -- TabLineFill = {},
        -- TabLineSel = {},
        -- TermCursor = {},
        Title = { fg = colors.cursor_line_nr },
        -- Tooltip = {},
        Visual = { bg = colors.select_hl },
        -- VisualNOS = {},
        WarningMsg = { fg = colors.warn },
        -- Whitespace = {},
        WildMenu = { bg = colors.bg_washed },
        -- WinBar = {},
        -- WinBarNC = {},
        WinSeparator = { fg = colors.ui_accent },
        -- lCursor = {},

        -- ========================================================================
        -- Diagnostics
        -- ========================================================================
        DiagnosticError = { fg = colors.error_light },
        DiagnosticHint = { fg = colors.hint },
        DiagnosticInfo = { fg = colors.info },
        DiagnosticWarn = { fg = colors.warn },
        DiagnosticOK = { fg = colors.ok },

        DiagnosticFloatingError = { link = "DiagnosticError" },
        DiagnosticFloatingHint = { link = "DiagnosticHint" },
        DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
        DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
        DiagnosticFloatingOk = { link = "DiagnosticOK" },

        DiagnosticSignError = { link = "DiagnosticError" },
        DiagnosticSignHint = { link = "DiagnosticHint" },
        DiagnosticSignInfo = { link = "DiagnosticInfo" },
        DiagnosticSignWarn = { link = "DiagnosticWarn" },
        DiagnosticSignOk = { link = "DiagnosticOK" },

        DiagnosticUnnecessary = { fg = colors.comments }, -- unused/empty code

        -- ========================================================================
        -- Syntax :h group-name 
        -- ========================================================================
        -- https://neovim.io/doc/user/syntax.html#highlight-groups
        Added = { fg = colors.ok },
        Bold = { bold = true },
        Boolean = { fg = colors.constant },
        Changed = { fg = colors.warn },
        Character = { fg = colors.string },
        Comment = { fg = colors.comments },
        Conditional = { fg = colors.keyword },
        Constant = { fg = colors.constant },
        Debug = { fg = colors.error_light },
        Define = { fg = colors.preproc },
        Delimiter = { fg = colors.delimiter },
        Error = { fg = colors.error_light },
        Exception = { fg = colors.keyword },
        Float = { fg = colors.constant },
        Function = { fg = colors.func },
        Identifier = { fg = colors.fg_main },
        -- Ignore = {},
        Include = { fg = colors.preproc },
        Italic = { italic = true },
        Keyword = { fg = colors.keyword },
        Label = { fg = colors.keyword },
        Macro = { fg = colors.preproc },
        Number = { fg = colors.constant },
        Operator = { fg = colors.operator },
        PreCondit = { fg = colors.preproc },
        PreProc = { fg = colors.preproc },
        Removed = { fg = colors.error_light },
        Repeat = { fg = colors.keyword },
        Special = { fg = colors.delimiter },
        SpecialChar = { link = "Special" },
        SpecialComment = { link = "Special" },
        Statement = { fg = colors.keyword },
        StorageClass = { fg = colors.type },
        String = { fg = colors.string },
        Structure = { fg = colors.type },
        Tag = { fg = colors.func },
        Todo = { fg = colors.comments },
        Type = { fg = colors.field },
        TypeDef = { fg = colors.field },
        -- Typedef = {},
        Underlined = { underline = true }, -- ex html links


        -- ========================================================================
        -- Tresitter :h treesitter-highlight
        -- ========================================================================
        -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
        ["@attribute"] = { link = "PreProc" }, 
        ["@attribute.builtin"] = { link = "PreProc" }, 
        ["@boolean"] = { link = "Boolean" }, 
        ["@character"] = { link = "String" }, 
        -- ["@character.special"] = {},
        -- ["@comment"] = {},
        -- ["@comment.documentation"] = {},
        ["@comment.error"] = { fg = colors.error_light }, 
        ["@comment.note"] = { fg = colors.info }, 
        ["@comment.todo"] = { fg = colors.hint }, 
        ["@comment.warning"] = { fg = colors.warn }, 
        ["@constant"] = { link = "Constant" }, 
        ["@constant.builtin"] = { link = "Constant" },
        ["@constant.macro"] = { link = "Constant" }, 
        ["@constructor"] = { fg = colors.func }, 
        ["@constructor.lua"] = { fg = colors.delimiter },
        ["@diff.delta"] = { link = "DiffChange" }, 
        ["@diff.minus"] = { link = "DiffDelete" }, 
        ["@diff.plus"] = { link = "DiffAdd" }, 
        -- ["@function"] = {},
        ["@function.builtin"] = { fg = colors.func }, 
        ["@function.call"] = { fg = colors.func }, 
        -- ["@function.macro"] = {},
        ["@function.method"] = { fg = colors.func }, 
        ["@function.method.call"] = { fg = colors.func }, 
        -- ["@keyword"] = {},
        ["@keyword.conditional"] = { fg = colors.keyword }, 
        -- ["@keyword.conditional.ternary"] = {},
        ["@keyword.coroutine"] = { fg = colors.field }, 
        -- ["@keyword.debug"] = {},
        ["@keyword.directive"] = { fg = colors.preproc }, 
        ["@keyword.directive.define"] = { fg = colors.preproc }, 
        ["@keyword.exception"] = { link = "Exception" }, 
        ["@keyword.function"] = { fg = colors.field }, 
        ["@keyword.import"] = { link = "Include" }, 
        -- ["@keyword.modifier"] = {},
        ["@keyword.operator"] = { link = "Operator" }, 
        ["@keyword.repeat"] = { link = "Repeat" }, 
        ["@keyword.return"] = { link = "Keyword" }, 
        ["@keyword.storage"] = { link = "StorageClass" }, 
        ["@keyword.type"] = { link = "Structure" }, 
        -- ["@label"] = {},
        ["@markup.heading"] = { fg = colors.type }, 
        -- ["@markup.heading.1"] = {},
        -- ["@markup.heading.2"] = {},
        -- ["@markup.heading.3"] = {},
        -- ["@markup.heading.4"] = {},
        -- ["@markup.heading.5"] = {},
        -- ["@markup.heading.6"] = {},
        ["@markup.italic"] = { link = "Italic" }, 
        ["@markup.link"] = { underline = false }, 
        ["@markup.link.label"] = { fg = colors.preproc }, 
        ["@markup.link.url"] = { fg = colors.link }, 
        -- ["@markup.list"] = {},
        -- ["@markup.list.checked"] = {},
        -- ["@markup.list.unchecked"] = {},
        -- ["@markup.math"] = {},
        -- ["@markup.quote"] = {},
        ["@markup.raw"] = { fg = colors.fg_main }, 
        ["@markup.raw.block"] = { fg = colors.fg_main }, 
        ["@markup.strikethrough"] = { strikethrough = true }, 
        -- ["@markup.strong"] = {},
        ["@markup.underline"] = { link = "Underlined" }, 
        ["@module"] = { fg = colors.field }, 
        ["@module.builtin"] = { link = "@module" }, 
        ["@number"] = { link = "Number" }, 
        ["@number.float"] = { link = "Float" }, 
        ["@operator"] = { link = "Operator" }, 
        -- ["@property"] = {},
        -- ["@punctuation.bracket"] = {},
        -- ["@punctuation.delimiter"] = {},
        -- ["@punctuation.special"] = {},
        -- ["@string"] = {},
        ["@string.css"] = { fg = colors.string },
        ["@string.documentation"] = { link = "Comment" },
        -- ["@string.escape"] = {},
        -- ["@string.regexp"] = {},
        -- ["@string.special"] = {},
        -- ["@string.special.path"] = {},
        -- ["@string.special.symbol"] = {},
        ["@string.special.url"] = { fg = colors.link }, 
        -- ["@tag"] = {},
        -- ["@tag.attribute"] = {},
        -- ["@tag.builtin"] = {},
        ["@tag.css"] = { fg = colors.keyword },
        -- ["@tag.delimiter"] = {},
        ["@tag.delimiter.html"] = { fg = colors.delimiter },
        ["@tag.html"] = { fg = colors.keyword },
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" }, 
        ["@type.definition"] = { link = "Type" }, 
        ["@variable"] = { link = "Identifier" }, 
        ["@variable.builtin"] = { link = "Keyword" }, 
        -- ["@variable.member"] = {},
        ["@variable.parameter"] = { fg = colors.func_param }, 
        ["@variable.parameter.builtin"] = { fg = colors.func_param }, 

        -- ========================================================================
        -- LSP semantic tokens
        -- ========================================================================
        ["@lsp.type.variable"] = { link = "Identifier" },
        ["@lsp.type.parameter"] = { link = "@variable.parameter" },
        ["@lsp.type.namespace"] = { fg = colors.field },
        -- ["@lsp.typemod.type.defaultLibrary"] = { fg = colors.field },
        -- ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.func },

        ------------------------------------
        --          CMP HIGHLIGHTS        --
        ------------------------------------
        CmpDocumentation                                          = { link = 'Normal' },
        CmpDocumentationBorder                                    = { link = 'Normal' },

        CmpItemAbbr                                               = { fg = p.comments },
        CmpItemAbbrDeprecated                                     = { fg = p.ui_accent, italic = true },
        CmpItemAbbrMatch                                          = { fg = p.fg_main },
        CmpItemAbbrMatchFuzzy                                     = { fg = p.fg_main },

        CmpItemKindDefault                                        = { fg = p.fg_main },
        CmpItemMenu                                               = { fg = p.comments },

        CmpItemKindKeyword                                        = { link = 'Identifier' },

        CmpItemKindVariable                                       = { link = '@variable' },
        CmpItemKindConstant                                       = { link = 'Constant' },
        CmpItemKindReference                                      = { link = 'Keyword' },
        CmpItemKindValue                                          = { link = 'Keyword' },

        CmpItemKindFunction                                       = { link = 'Function' },
        CmpItemKindMethod                                         = { link = 'Function' },
        CmpItemKindConstructor                                    = { link = 'Function' },

        CmpItemKindInterface                                      = { link = 'Constant' },
        CmpItemKindEvent                                          = { link = 'Constant' },
        CmpItemKindEnum                                           = { link = 'Constant' },
        CmpItemKindUnit                                           = { link = 'Constant' },

        CmpItemKindClass                                          = { link = 'Type' },
        CmpItemKindStruct                                         = { link = 'Type' },

        CmpItemKindModule                                         = { link = '@module' },

        CmpItemKindProperty                                       = { link = '@property' },
        CmpItemKindField                                          = { link = '@field' },
        CmpItemKindTypeParameter                                  = { link = '@field' },
        CmpItemKindEnumMember                                     = { link = '@field' },
        CmpItemKindOperator                                       = { link = 'Operator' },
        CmpItemKindSnippet                                        = { fg = p.preproc },

        ------------------------------------
        --            GITSIGNS            --
        ------------------------------------
        GitSignsAdd                                               = { fg = p.ok },
        GitSignsChange                                            = { fg = p.warn },
        GitSignsDelete                                            = { fg = p.error_light },

        -------------------------------------
        --              FLASH              --
        -------------------------------------
        FlashBackdrop                                             = { fg = p.comments, bg = '#000000', italic = false },
        FlashLabel                                                = { fg = p.bg_main, bg = p.pop1, bold = false },

        ------------------------------------
        --            WHICHKEY            --
        ------------------------------------
        -- WhichKey           = {}, -- the key
        -- WhichKeyGroup      = {}, -- a group
        -- WhichKeySeparator  = {}, -- the sparator between the key and its label
        -- WhichKeyDesc       = {}, -- the label of the key
        WhichKeyFloat                                             = { bg = p.bg_washed }, -- normal in the popup window
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
        LazyProp                                                  = { fg = p.type }, -- property
        -- LazyReasonCmd        = { 'Operator' },
        -- LazyReasonEvent      = { 'Constant' },
        -- LazyReasonFt         = { 'Character' },
        LazyReasonImport                                          = { fg = p.func_param },
        LazyReasonKeys                                            = { fg = p.func },
        LazyReasonPlugin                                          = { fg = p.type },
        -- LazyReasonRequire    = { '@variable.parameter' },
        LazyReasonRuntime                                         = { fg = p.comments },
        LazyReasonSource                                          = { fg = p.string },
        LazyReasonStart                                           = { fg = p.func },
        -- LazySpecial          = { '@punctuation.special' },
        -- LazyTaskError        = { 'ErrorMsg' }, -- task errors
        -- LazyTaskOutput       = { 'MsgArea' }, -- task output
        -- LazyUrl              = { '@markup.link' }, -- url
        -- LazyValue            = { '@string' }, -- value of a property

        ------------------------------------
        --              NEORG             --
        ------------------------------------
        ['@neorg.headings.1.title']                               = { fg = p.header1 },
        ['@neorg.headings.2.title']                               = { fg = p.header2 },
        ['@neorg.headings.3.title']                               = { fg = p.header3 },
        ['@neorg.headings.4.title']                               = { fg = p.header4 },
        ['@neorg.headings.5.title']                               = { fg = p.header5 },
        ['@neorg.headings.6.title']                               = { fg = p.header6 },
        ['@neorg.headings.1.prefix']                              = { fg = p.fg_main },
        ['@neorg.headings.2.prefix']                              = { fg = p.fg_main },
        ['@neorg.headings.3.prefix']                              = { fg = p.fg_main },
        ['@neorg.headings.4.prefix']                              = { fg = p.fg_main },
        ['@neorg.headings.5.prefix']                              = { fg = p.fg_main },
        ['@neorg.headings.6.prefix']                              = { fg = p.fg_main },

        -- ['@neorg.links.location.heading.1'] = {},
        -- ['@neorg.links.location.heading.2'] = {},
        -- ['@neorg.links.location.heading.3'] = {},
        -- ['@neorg.links.location.heading.4'] = {},
        -- ['@neorg.links.location.heading.5'] = {},
        -- ['@neorg.links.location.heading.6'] = {},
        --
        ['@neorg.todo_items.undone']                              = { fg = p.delimiter },
        ['@neorg.todo_items.done']                                = { fg = p.func },
        ['@neorg.todo_items.on_hold']                             = { fg = p.ui_accent },
        ['@neorg.todo_items.cancelled']                           = { fg = p.comments },
        ['@neorg.todo_items.uncertain']                           = { fg = p.string },
        ['@neorg.todo_items.pending']                             = { fg = p.field },
        ['@neorg.todo_items.recurring']                           = { fg = p.preproc },
        ['@neorg.todo_items.urgent']                              = { fg = p.operator },
        -- ['@neorg.lists.unordered.prefix'] = {},
        -- ['@neorg.lists.ordered.prefix'] = {},
        --
        -- ['@neorg.markup.verbatim'] = {},
        -- NeorgMetaKey                    = { fg = p.comments },

        -- This is all meta tag styling
        ['@neorg.tags.ranged_verbatim.name.word.norg']            = { fg = p.preproc },
        ['@neorg.tags.ranged_verbatim.document_meta.key']         = { link = 'Comment' },
        ['@neorg.tags.ranged_verbatim.document_meta.categories']  = { fg = p.func },
        ['@neorg.tags.ranged_verbatim.document_meta.description'] = { fg = p.string },
        ['@neorg.tags.ranged_verbatim.document_meta.created']     = { fg = p.func_param, italic = true },
        ['@neorg.tags.ranged_verbatim.document_meta.updated']     = { fg = p.func_param, italic = true },
        ['@neorg.tags.ranged_verbatim.document_meta.version']     = { fg = p.func_param, italic = true },

        -- ['@neorg.links'] = {},
        -- ['@neorg.links.file'] = {},
        ['@neorg.links.description']                              = { fg = p.preproc },
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
    fg            = true,   -- color name or "#RRGGBB"
    bg            = true,   -- color name or "#RRGGBB"
    sp            = true,   -- color name or "#RRGGBB"
    blend         = true,   -- integer between 0 and 100
    bold          = true,   -- boolean
    standout      = true,   -- boolean
    underline     = true,   -- boolean
    undercurl     = true,   -- boolean
    underdouble   = true,   -- boolean
    underdotted   = true,   -- boolean
    underdashed   = true,   -- boolean
    strikethrough = true,   -- boolean
    italic        = true,   -- boolean
    reverse       = true,   -- boolean
    nocombine     = true,   -- boolean
    link          = true,   -- name of another highlight group to link to. :hi-link
    -- stylua: ignore end
}

---validates the attr name as one the color scheme supports altering
---@param attr_name string
---@return boolean
M._validate_hl_attr = function(attr_name)
    return _valid_attr_names[attr_name] == true
end

return M
