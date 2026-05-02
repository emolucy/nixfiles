local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function not_math()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

local function never_show()
	return false
end

ls.add_snippets("tex", {
	s({ trig = "mk", snippetType = "autosnippet", condition = not_math, priority = 10000 }, {
		t("\\("),
		i(1),
		t("\\)"),
	}),
	s({ trig = "dm", snippetType = "autosnippet", condition = not_math, priority = 10000 }, {
		t({ "\\[", "\t" }),
		i(1),
		t({ "", "\\]" }),
		i(0),
	}),
})

vim.api.nvim_create_autocmd("FileType", {
	group = "Autocmds",
	pattern = "tex",
	callback = function()
		local existing = ls.get_snippets("tex")
		if not existing then
			return
		end
		for _, snip in ipairs(existing) do
			if (snip.trigger == "mk" or snip.trigger == "dm") and snip.priority ~= 10000 then
				snip.show_condition = never_show
				snip.hidden = true
			end
		end
	end,
})
