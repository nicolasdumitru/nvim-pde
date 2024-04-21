-- UI settings

-- These settings determine how Neovim looks in terms of UI elements and what gets displayed.
-- Colors and the colorscheme are beyond the scope of these settings.

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Toggle relative numbers automatically
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
            vim.opt.relativenumber = true
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "CmdlineEnter", "WinLeave" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if vim.o.nu then
            vim.opt.relativenumber = false
            vim.cmd "redraw"
        end
    end,
})

-- Line/column highlighting
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Signcolumn
vim.opt.signcolumn = "yes:2"

-- Cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- List mode (show invisible characters)
vim.opt.list = true
vim.opt.listchars = {
    tab = "▎  ",
    leadmultispace = "    ",
    trail = "·",
    nbsp = "+",
}
-- Highlight all search matches
vim.opt.hlsearch = true

-- Conceal level (how concealed text is shown)
vim.opt.conceallevel = 2

-- Window title
vim.opt.title = true
