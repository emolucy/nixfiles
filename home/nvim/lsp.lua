-- lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

-- java
vim.api.nvim_create_autocmd("FileType", {
	group = "augroup",
	pattern = "java",
	callback = function()
		local jdtls = require("jdtls")
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspaces/" .. project_name

		jdtls.start_or_attach({
			cmd = { "jdtls", "-data", workspace_dir },
			root_dir = vim.fs.root(0, { ".git" }),
			settings = { java = {} },
		})
	end,
})

-- enable servers
vim.lsp.enable({
	"nil_ls",
	"lua_ls",
	"latexmk",
})

-- lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = "augroup",
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	end,
})
