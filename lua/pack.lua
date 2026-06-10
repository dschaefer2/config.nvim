vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim"
})

-- oil

require("oil").setup({
    keymaps = {
        ["<C-p>"] = false,
        ["<Esc>"] = { "actions.close", mode = "n" },
    }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- lualine

require("lualine").setup()

-- mini

require("mini.notify").setup()

