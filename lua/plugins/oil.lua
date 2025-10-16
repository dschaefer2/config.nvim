return {
    "stevearc/oil.nvim",
    -- enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
           default_file_explorer = true, -- start up nvim with oil instead of netrw
            columns = { },
            keymaps = {
                ["<TAB>"] = "actions.preview",

                ["<C-p>"] = function()
                    vim.cmd("normal! k")
                end,

                ["<C-n>"] = function()
                    vim.cmd("normal! j")
                end,
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        vim.keymap.set("n", "<leader>f", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil", -- Adjust if Oil uses a specific file type identifier
            callback = function()
                vim.opt_local.cursorline = true
            end,
        })
    end,
}
