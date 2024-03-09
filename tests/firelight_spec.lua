---@diagnostic disable:undefined-global, undefined-field

describe("config", function()
	local cfg = require("firelight.config")
	local default

	before_each(function()
		default = require("firelight.config").default()
	end)

	it("merge_options: nil opts", function()
		local opts = nil
		local expected = default
		local result = cfg.merge_options(opts)
		assert.are.same(result, expected)
	end)

	it("merge_options: non-overlapping opts", function()
		local opts = { test = { test = true } }
		local result = cfg.merge_options(opts)
		local expected = default
		expected.test = { test = true }
		assert.are.same(result, default)
	end)

	it("merge_options: overlapping opts", function()
		local opts = { formatting = { Comment = { italic = false } } }
		local result = cfg.merge_options(opts)
		local expected = default
		expected.formatting.Comment = { italic = false, bold = true }
		assert.are.same(result, expected)
	end)
end)

describe("theme", function()
	local theme = require("firelight.theme")

	it("apply_styling: basic", function()
		local hls = { Comment = { fg = "test", bg = "test" } }
		local style = { Comment = { fg = "not test", italic = true } }
		local expected = { Comment = { fg = "not test", bg = "test", italic = true } }
		local result = theme._apply_styling(style, hls)
		assert.are.same(expected, result)
	end)

	it("validate_styling: deez", function()
		local style = "deez"
		local result = theme._validate_hl_attr(style)
		assert.are.same(false, result)
	end)
	it("validate_styling: italic", function()
		local style = "italic"
		local result = theme._validate_hl_attr(style)
		assert.are.same(true, result)
	end)

	it("sanity check", function()
		local hls = { a = { b = true, c = false } }
		local styling = { a = { c = true, d = true } }
		local expected = { a = { b = true, c = true, d = true } }
		-- local result = vim.tbl_deep_extend("force", start, styls)
		local result = theme._apply_styling(styling, hls)
		assert.are.same(expected, result)
	end)
end)

describe("init:", function()
	it("config stored: no opts ", function()
		local m = require("firelight")
		m.setup()
		local expected = { palette_name = "Default", formatting = { Comment = { italic = true, bold = true } } }
		assert(expected, m.__config)
	end)

	it("config stored: some opts ", function()
		local m = require("firelight")
		m.setup({ formatting = { Comment = { italic = false } } })
		local expected = { palette_name = "Default", formatting = { Comment = { italic = false, bold = true } } }
		assert(expected, m.__config)
	end)
end)
