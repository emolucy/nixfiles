-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move selected lines up and down (respects indentation)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move line below onto current line
vim.keymap.set("n", "J", "mzJ`z")

-- while scrolling with C-u and C-d, keep the cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- while moving between search terms keep them in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

-- ensure ctrl c and esc operate identically
vim.keymap.set("i", "<C-c>", "<Esc>")

-- find and replace over current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- fix last spelling mistake
vim.keymap.set("i", "<C-s>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { silent = true })

-- toggle filetree
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)

-- file tab navigation
vim.keymap.set("n", "<leader>l", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<leader>h", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>L", vim.cmd.BufferLineMoveNext)
vim.keymap.set("n", "<leader>H", vim.cmd.BufferLineMovePrev)
vim.keymap.set("n", "<leader>x", vim.cmd.Bdelete)

-- luasnip
vim.keymap.set("x", "<Tab>", "<Plug>luasnip-expand-or-jump")

-- compile vimtex
vim.keymap.set("n", "<leader>c", vim.cmd.VimtexCompile)

-- toggle diffview
vim.keymap.set("n", "<leader>dt", function()
	local lib = require("diffview.lib")
	local view = lib.get_current_view()
	if view then
		-- close if current page is diffview
		vim.cmd.DiffviewClose()
	else
		-- open new diffview if none exist
		vim.cmd.DiffviewOpen()
	end
end)

-- open/close diffview
vim.keymap.set("n", "<leader>do", vim.cmd.DiffviewOpen)
vim.keymap.set("n", "<leader>dc", vim.cmd.DiffviewClose)
