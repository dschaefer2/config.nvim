return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.x",
        opts = {
            keymap = { preset = "super-tab" },
            appearance = {
                nerd_font_variant = "mono"
            },
            sources = {
                default = { "lsp", "path", "snippets" }
            }
        }
    }
}
