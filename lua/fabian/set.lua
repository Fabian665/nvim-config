vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
local home_path = os.getenv("HOME")
if (home_path == nil) then
    home_path = os.getenv("UserProfile")
end
vim.opt.undodir = home_path .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.opt.termguicolors = true
vim.opt.updatetime = 50

vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.ff = "unix"
