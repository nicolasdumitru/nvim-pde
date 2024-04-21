local function configuration()
    require("ibl").setup({
        indent = {
            -- center aligned '┃'
            -- left aligned   '▎'
            char = '▎',
            tab_char = '▎',
        }
    })
end

return
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = configuration,
    lazy = true,
    event = "VeryLazy",
}
