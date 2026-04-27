local augroup = vim.api.nvim_create_augroup("Autocmds", { clear = true })

-- enable spellcheck in tex files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

-- 2-space indent for nix files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "nix",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		-- disable treesitter indent
		vim.bo.indentexpr = ""
	end,
})

-- auto close nvim-tree
vim.api.nvim_create_autocmd({ "QuitPre" }, {
	group = augroup,
	callback = function()
		local ft = vim.bo.filetype
		pcall(vim.cmd, "NvimTreeClose")
		if ft == "NvimTree" then
			vim.cmd("qall")
		end
	end,
})
