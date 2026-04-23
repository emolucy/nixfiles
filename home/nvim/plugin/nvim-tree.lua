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
