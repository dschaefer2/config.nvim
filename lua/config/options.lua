vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.confirm = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

