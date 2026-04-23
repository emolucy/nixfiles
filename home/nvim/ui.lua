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
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		offsets = {
			{
				filetype = "NvimTree",
			},
		},
		tab_size = 20,
	},
})
