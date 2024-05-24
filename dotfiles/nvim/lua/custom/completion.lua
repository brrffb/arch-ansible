require "custom.snippets"

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<cr>")

vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init {}

local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
  },

  -- Enable luasnip to handle snippet expansion for nvim-cmp
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
}
