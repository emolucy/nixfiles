local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function not_math()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

local function in_math()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

ls.add_snippets("tex", {
	s({ trig = "mk", snippetType = "autosnippet", condition = not_math }, {
		t("\\("),
		i(1),
		t("\\)"),
	}),
	s({ trig = "dm", snippetType = "autosnippet", condition = not_math }, {
		t({ "\\[", "\t" }),
		i(1),
		t({ "", "\\]" }),
		i(0),
	}),
})
