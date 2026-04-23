require("bufferline").setup({
	highlights = require("catppuccin.special.bufferline").get_theme(),
	options = {
		offsets = {
			{
				filetype = "NvimTree",
			},
		},
		tab_size = 20,
	},
})
