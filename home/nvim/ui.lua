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

-- lualine
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		section_separators = "",
		component_separators = "",
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree" },
})
