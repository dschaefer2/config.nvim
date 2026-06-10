vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/Saghen/blink.cmp",
    "https://github.com/ibhagwan/fzf-lua",
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

-- fzf-lua

require("fzf-lua").setup({
    'default',
})

local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>ff', fzf.files,        { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep,    { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', fzf.buffers,      { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', fzf.helptags,     { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fr', fzf.resume,       { desc = 'Resume last picker' })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf }
        local fzf = require('fzf-lua')

        -- navigation
        vim.keymap.set('n', 'gd', fzf.lsp_definitions,      opts)
        vim.keymap.set('n', 'gD', fzf.lsp_declarations,     opts)
        vim.keymap.set('n', 'gi', fzf.lsp_implementations,  opts)
        vim.keymap.set('n', 'gr', fzf.lsp_references,       opts)
        vim.keymap.set('n', 'gt', fzf.lsp_typedefs,         opts)

        -- symbols
        vim.keymap.set('n', '<leader>ds', fzf.lsp_document_symbols,           opts)
        vim.keymap.set('n', '<leader>ws', fzf.lsp_live_workspace_symbols,     opts)

        -- diagnostics
        vim.keymap.set('n', '<leader>dd', fzf.lsp_document_diagnostics,       opts)
        vim.keymap.set('n', '<leader>dw', fzf.lsp_workspace_diagnostics,      opts)

        -- actions (fzf-lua provides a nice picker UI for these too)
        vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions,              opts)

        -- these aren't fzf pickers, keep the native ones
        vim.keymap.set('n', 'K',  vim.lsp.buf.hover,  opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
})

-- lualine

require("lualine").setup()

-- mini

require("mini.notify").setup()
require("mini.pairs").setup()

