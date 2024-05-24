local opt = vim.opt

opt.inccommand = "split"

opt.clipboard = "unnamedplus"

opt.smartcase = true
opt.ignorecase = true

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

opt.termguicolors = true

opt.updatetime = 50

opt.list = true
opt.listchars:append "eol:↲"

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    opt.formatoptions:remove "o"
  end,
})
