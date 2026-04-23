require("conform").setup({
    formatters_by_ft = {
        nix = { "nixfmt" },
        lua = { "stylua" },
    },
    format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
    },
})
 
vim.keymap.set("n", "<leader>ff", function()
    require("conform").format()
end, { desc = "Format file" })
