local lush = require('lush')
local hsl = lush.hsl -- We'll use hsl a lot so its nice to bind it separately

---@alias Color string
local fg_main = hsl('#ECE1D7')
local select_hl = hsl('#524f4c')
local cursorline = hsl('#363432').li(5)
print('cursorline: ' .. tostring(cursorline))
local bg_washed = hsl('#34302C')
local bg_main = hsl('#292522')
local black = hsl('#000000')
local comments = hsl('#91908e')
local ui_accent = hsl('#867462').sa(10).li(10)
local delimiter = hsl('#8B7449').li(40).sa(35)
print('delimiter: ' .. tostring(delimiter))

---@type Color
local str = 'nteslar'

local constants = setmetatable({}, {
	__index = {
		x = 'hello',
	},
	__newindex = function() end,
})

local var_main = hsl('#ECE1D7')
local func = hsl('#85b695')
local string = hsl('#A3A9CE').sa(10).ro(344)
print('string: ' .. tostring(string))
local type = hsl('#E49B5D').li(25).sa(31)
print('type: ' .. tostring(type))
local field = hsl('#E49B5D').li(65)
local keyword = hsl('#af2182').li(44).de(40)
local number = hsl('#CF9BC2').li(21).sa(15)
print('number: ' .. tostring(number))
local constant = hsl('#987fb8').li(55).sa(15)
print('constant: ' .. tostring(constant))
local preproc = hsl('#B380B0').ro(80).sa(35)
local operator = hsl('#D47766')
local ok = hsl('#78997A')
local warn = hsl('#EBC06D')
local info = hsl('#7F91B2')
local hint = hsl('#9C848F')
local error_light = hsl('#BD8183')
local error_dark = hsl('#7D2A2F')

local puce = hsl('#d6a2ad')
local khaki = hsl('#c3b59f')
local olivine = hsl('#a0af84')
local viridian = hsl('#668f80').sa(50).li(20)
print('viridian:' .. tostring(viridian))
local viridian2 = hsl('#b1c8c0').da(5).sa(10)
print('viridian2: ' .. tostring(viridian2))
local paynes_gray = hsl('#4a6670').li(40).sa(10)
local glaucous = hsl('#7d82b8')
local russet = hsl('#7a4419')
local bright_pink = hsl('#ef476f')
local flourescent_cyan = hsl('#00e5e8')
local screamin_green = hsl('#87ff65')
local carrot_orange = hsl('#f9a03f')
local jasmine = hsl('#f7d488').li(15).sa(40)
print('jasmine: ' .. tostring(jasmine))
local cream = hsl('#eaefb1')
local nyanza = hsl('#e9f7ca')
local pale_dogwood = hsl('#ceb5a7')
local isabelline = hsl('#f2efe9')
local cordovan = hsl('#904e55')
local ecru = hsl('#bfb48f')
local slate_gray = hsl('#767b91')
local rufous = hsl('#a33b20')

---@diagnostic disable: undefined-global
local theme = lush(function()
	return {

		Normal({ fg = fg_main, bg = bg_main }),
		NormalFloat({ bg = bg_main }),
		NormalNC({ fg = fg_main, bg = bg_washed }),
		NvimInternalError({ fg = fg_main, bg = error_dark }),
		CurSearch({ fg = p.fg_main, bg = p.select_hl, bold = true, italic = false }),
		Cursor({ fg = p.bg_main, bg = p.fg_main }),
		CursorLineNr({ fg = carrot_orange }),
		DiffAdd({ fg = ok }),
		DiffChange({ fg = warn }),
		DiffDelete({ fg = error_light }),
		ErrorMsg({ fg = error_light }),
		FoldColumn({ bg = bg_washed }),
		MatchParen({ bg = select_hl }),
		LineNr({ fg = ui_accent }),
		CursorLine({ bg = cursorline }),
		SignColumn({ bg = bg_main }),
		Visual({ bg = select_hl }),
		WarningMsg({ fg = warn }),
		WildMenu({ bg = comments }),
		WinSerator({ fg = ui_accent }),

		ColorColumn({ CursorLine }),
		CursorColumn({ CursorLine }),
		CursorIM({ Cursor }),
		Directory({ fg = string }),
		FloatBorder({ NormalFloat }),
		FloatTitle({ Normal }),
		Folded({ FoldColumn }),
		IncSearch({ CurSearch }),
		ModeMsg({ Normal }),
		MoreMsg({ Normal }),
		-- NonText({ fg = p.bg_main, bg = p.bg_main }),
		Pmenu({ NormalFloat }),
		PmenuExtra({ Pmenu }),
		PmenuExtraSel({ Visual }),
		PmenuKind({ Pmenu }),
		PmenuKindSel({ Visual }),
		PmenuSbar({ Pmenu }),
		PmenuSel({ Visual }),
		PmenuThumb({ PmenuSel }),
		-- Question({}),
		-- QuickFixLink({}),
		Search({ CurSearch }),
		SignColumnSB({ SignColumn }),
		-- SpecialKey({}),
		-- SpellBad({}),
		-- SpellCap({}),
		-- SpellLocal({}),
		-- SpellRare({}),
		-- StatusLine({}),
		-- StatusLineNC({}),
		-- StatusLineTerm({}),
		-- StatusLineTermNC({}),
		Substitute({ IncSearch }),
		-- TabLine({}),
		-- TabLineFill({}),
		-- TabLineSel({}),
		Title({ CursorLineNr }),
		-- VertSplit({}),
		-- WinBar({}),
		-- WinBarNC({}),

		Comment({ fg = comments }),
		Constant({ fg = constant }),
		String({ fg = string, italic = true }),
		Character({ String }),
		Number({ fg = number }),
		Float({ Number }),
		Boolean({ Number }),

		Identifier({ fg = fg_main }),
		Function({ fg = func }),

		Keyword({ fg = keyword }),
		Statement({ Keyword }),
		Label({ Keyword }),
		Exception({ Keyword }),
		Operator({ fg = operator }),
		Conditional({ Operator }),
		Repeat({ Operator }),

		PreProc({ fg = preproc }),
		Include({ PreProc }),
		Define({ PreProc }),
		Macro({ PreProc }),
		PreCondit({ PreProc }),

		Type({ fg = type }),
		TypeDef({ Type }),
		StorageClass({ Type }),
		Structure({ Type }),

		Special({ fg = delimiter }),
		SpecialChar({ Special }),
		SpecialComment({ Special }),
		Tag({ Special }),
		Delimiter({ fg = delimiter }),

		Underlined({ underline = true }), -- ex html links
		Bold({ bold = true }),
		Italic({ italic = true }),

		Error({ ErrorMsg }),
		Todo({ fg = comments }),
		Debug({ Error }),
	}
end)

local A = function(this)
	for _, a in pairs(this) do
		string.sub(a, 1, 3)
	end
end

return theme

-- vi:nowrap:number
