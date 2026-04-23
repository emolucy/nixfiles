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

-- file tabs (autocmd forces it to load after the colorscheme)
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin*",
	callback = function()
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
	end,
})
