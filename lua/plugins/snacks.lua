return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
            }
        },
        keys = {
            { "<leader>pb", function() require('snacks').picker.buffers() end, desc = "Pick buffers" },
            { "<leader>pf", function() require('snacks').picker.files() end, desc = "Pick files" },
            { "<leader>pgs", function() require('snacks').picker.git_status() end, desc = "Git status" },
        }
    }
}
