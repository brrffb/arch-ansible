require("eyeliner").setup({
    highlight_on_key = true,
    dim = true,
})

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#ffbf00', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#89cff0', underline = true })
