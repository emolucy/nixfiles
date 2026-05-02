local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.api.nvim_create_autocmd("FileType", {
	group = "Autocmds",
	pattern = "tex",
	callback = function()
		local ls = require("luasnip")
		local existing = ls.get_snippets("tex")
		if not existing then
			return
		end
		for idx = #existing, 1, -1 do
			local trig = existing[idx].trigger
			if trig == "mk" or trig == "dm" then
				table.remove(existing, idx)
			end
		end
	end,
})

local function not_math()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
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
