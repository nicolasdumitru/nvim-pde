local function configuration()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            border = true,
        },
        pickers = {
            commands = {
                theme = "ivy",
            },
            current_buffer_fuzzy_find = {
                theme = "dropdown",
            },
        },
        extensions = {
            file_browser = {
                hijack_netrw = true,
                sorting_strategy = "ascending",
                layout_config = { prompt_position = "top" },
            },
        },
    })

    local fb = telescope.load_extension("file_browser")

    local palette = require("nick.core.highlights.gruvbox")

    local highlight_groups = {
        { "TelescopeMatching",      { fg = palette.bright_orange, underline = true } },
        { "TelescopeSelection",     { bg = palette.dark1 } }, -- gitsigns
        { "TelescopeNormal",        { fg = palette.light1, bg = palette.dark0_hard } },
        { "TelescopePromptNormal",  { bg = palette.dark1 } }, -- gitsigns
        { "TelescopeResultsBorder", { fg = palette.dark0_hard, bg = palette.dark0_hard } },
        { "TelescopePreviewBorder", { fg = palette.dark0_hard, bg = palette.dark0_hard } },
        { "TelescopePromptBorder",  { fg = palette.dark1, bg = palette.dark1 } },
        { "TelescopePromptTitle",   { fg = palette.dark1, bg = palette.bright_blue } },
        { "TelescopeResultsTitle",  { fg = palette.dark1, bg = palette.bright_aqua } },
        { "TelescopePreviewTitle",  { fg = palette.dark1, bg = palette.bright_aqua } },
    }

    for _, hl in pairs(highlight_groups) do
        vim.api.nvim_set_hl(0, hl[1], hl[2])
    end

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<Leader>st", builtin.builtin,
        { desc = "Telescope: Search builtins" })
    vim.keymap.set("n", "<Leader>sf", builtin.find_files,
        { desc = "Telescope: Search files" })
    vim.keymap.set("n", "<Leader>sr", builtin.git_files,
        { desc = "Telescope: Search files in git repo" })
    vim.keymap.set("n", "<Leader>sg", builtin.live_grep,
        { desc = "Telescope: Live grep" })
    vim.keymap.set("n", "<Leader>/", builtin.current_buffer_fuzzy_find,
        { desc = "Telescope: Current buffer fuzzy find" })
    vim.keymap.set("n", "<Leader>sb", builtin.buffers,
        { desc = "Telescope: List open buffers" })
    vim.keymap.set("n", "<Leader>so", builtin.oldfiles,
        { desc = "Telescope: Search previously open files" })
    vim.keymap.set("n", "<Leader>sh", builtin.help_tags,
        { desc = "Telescope: List help" })
    vim.keymap.set("n", "<Leader>:", builtin.commands,
        { desc = "Telescope: List plugin/user commands" })
    vim.keymap.set({ "n", "i" }, "<M-x>", builtin.commands,
        { desc = "Telescope: List plugin/user commands" })
    vim.keymap.set("n", "<Leader>sk", builtin.keymaps,
        { desc = "Telescope: List custom keybindings" })
    vim.keymap.set("n", "<Leader>slr", builtin.lsp_references,
        { desc = "Telescope: List LSP references" })
    vim.keymap.set("n", "<Leader>fm", fb.file_browser,
        { desc = "Telescope: telescope-file-browser" })
end

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    name = "Telescope",
    event = "VeryLazy",
    config = configuration,
}
