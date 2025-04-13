return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "verilog",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                verible = {},
            },
        },
    },
}
