-- file tree
require("nvim-tree").setup({
	view = {
		width = 30,
	},
	filters = {
		custom = { "^.git$" },
		git_ignored = false,
	},
})

-- file tabs
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
