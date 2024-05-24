return {
  {
    "catppuccin/nvim",
    as = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base = "#14141f",
            mantle = "#14141f",
            crust = "#14141f",
          },
        },
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
