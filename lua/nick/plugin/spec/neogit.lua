return {
    "NeogitOrg/neogit",
    name = "Neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
    },
    config = true,
    event = "VeryLazy",
}
