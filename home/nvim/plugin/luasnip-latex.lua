local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function not_math()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

local function remove_by_trigger(filetype, triggers)
	local existing = ls.get_snippets(filetype)
	if not existing then
		return
	end
	for idx = #existing, 1, -1 do
		for _, trig in ipairs(triggers) do
			if existing[idx].trigger == trig then
				table.remove(existing, idx)
				break
			end
		end
	end
end

remove_by_trigger("tex", { "dm", "mk" })

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
