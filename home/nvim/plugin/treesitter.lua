-- highlighting
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- treesitter indent only for filetypes where it works well
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "python", "rust", "javascript", "typescript", "java", "c", "cpp" },
	callback = function(args)
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
