local mode = { "i", "x", "n", "s" }
vim.keymap.set(mode, "<C-f>", "<Right>")
vim.keymap.set(mode, "<C-b>", "<Left>")
vim.keymap.set(mode, "<C-n>", "<Down>")
vim.keymap.set(mode, "<C-p>", "<Up>")
vim.keymap.set(mode, "<C-a>", "<Home>")
vim.keymap.set(mode, "<C-e>", "<End>")
vim.keymap.set(mode, "<C-d>", "<Del>")
vim.keymap.set(mode, "<C-S-n>", "<PageDown>")
vim.keymap.set(mode, "<C-S-p>", "<PageUp>")

vim.keymap.set("i", "<C-CR>", "<Esc>")
vim.keymap.set("n", "<C-l>", "zz")
vim.keymap.set("n", "<C-k>", "d$")
