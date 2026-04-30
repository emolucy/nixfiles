-- file tree
require("nvim-tree").setup({
	view = {
		width = 30,
	},
	filters = {
		custom = { "^.git$", "^.settings$", "^.classpath$", "^.project$" },
		git_ignored = false,
	},
})
