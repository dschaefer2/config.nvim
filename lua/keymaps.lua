vim.g.mapleader = " "

-- Emacs keys for nvim? Yup.

local mode = { "i", "x", "n", "s" }
vim.keymap.set(mode, "<C-g>", "<Esc>")
vim.keymap.set(mode, "<C-f>", "<Right>")
vim.keymap.set(mode, "<C-b>", "<Left>")
vim.keymap.set(mode, "<C-n>", "<Down>")
vim.keymap.set(mode, "<C-p>", "<Up>")
vim.keymap.set(mode, "<C-a>", "<Home>")
vim.keymap.set(mode, "<C-e>", "<End>")

vim.keymap.set("n", "<C-g>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })
vim.keymap.set("n", "<C-d>", "x")
vim.keymap.set("i", "<C-d>", "<Del>")

vim.keymap.set("n", "<C-w><C-n>", "<C-w>j")

