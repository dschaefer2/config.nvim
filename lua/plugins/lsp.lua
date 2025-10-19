return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable({
                "lua_ls",
                "sourcekit",
            })

            vim.diagnostic.config({
                virtual_lines = true
            })
        end
    }
}
