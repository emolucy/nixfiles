-- file tree
require("nvim-tree").setup({
	view = {
		width = 35,
	},
	filters = {
		custom = { "^.git$" },
		git_ignored = false,
	},
})
