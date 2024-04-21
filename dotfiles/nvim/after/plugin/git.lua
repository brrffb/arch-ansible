local ok, neogit = pcall(require, "neogit")
if not ok then
    return
end

neogit.setup {
    integrations = {
        diffview = true,
    },
}

require("gitsigns").setup()

vim.keymap.set("n", "<leader>vv", ":DiffviewOpen<CR>")

vim.keymap.set("n", "<leader>gs", neogit.open)
vim.keymap.set(
    "n", "<leader>gc",
    function()
        neogit.open { "commit" }
    end
)
