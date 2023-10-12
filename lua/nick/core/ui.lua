-- UI settings

-- These settings determine how Neovim looks in terms of UI elements and what gets displayed.
-- Colors and the colorscheme are beyond the scope of these settings.

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Line/column highlighting
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Signcolumn settings
vim.opt.signcolumn = "yes:1"

-- List mode (show invisible characters)
vim.opt.list = true

-- Highlight all search matches
vim.opt.hlsearch = true

-- Conceal level (how concealed text is shown)
vim.opt.conceallevel = 2

-- Window title
vim.opt.title = true
