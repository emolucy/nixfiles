require("luasnip").config.setup({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})

require("luasnip-latex-snippets").setup({ use_treesitter = false })

require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = false,
		},
		keyword = {
			range = "prefix",
		},
	},

	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},

	snippets = {
		preset = "luasnip",
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = { enabled = true },
})
