-- UI settings

-- These settings determine how Neovim looks in terms of UI elements and what gets displayed.
-- Colors and the colorscheme are beyond the scope of these settings.

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

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
	leadmultispace = "····",
	trail = "·",
	nbsp = "+",
}
-- Highlight all search matches
vim.opt.hlsearch = true

-- Conceal level (how concealed text is shown)
vim.opt.conceallevel = 2

-- Window title
vim.opt.title = true
