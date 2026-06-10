vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/Saghen/blink.cmp",
})

-- oil

require("oil").setup({
    keymaps = {
        ["<C-p>"] = false,
        ["<Esc>"] = { "actions.close", mode = "n" },
    }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- lsp

vim.lsp.enable("sourcekit")

-- blink

require('blink.cmp').setup({
    keymap = { preset = 'default' },  -- <C-y> to accept, <C-space> to open, <C-n>/<C-p> to cycle

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = {
        implementation = "lua",
    },

    signature = { enabled = true },
})

-- lualine

require("lualine").setup()

-- mini

require("mini.notify").setup()
require("mini.pairs").setup()

