-- Window title
vim.opt.title = true

-- Minimum amount of lines above and below cursor
vim.opt.scrolloff = 4

-- Split rightward and downward
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tildeop (make tilde "~" behave like an operator)
vim.opt.tildeop = true

-- Open all folds
vim.opt.foldenable = false

-- Indentation settings
local tab_width = 4
vim.opt.shiftwidth = tab_width
vim.opt.softtabstop = tab_width
vim.opt.tabstop = tab_width
vim.opt.varsofttabstop = nil
vim.opt.vartabstop = nil
vim.opt.smartindent = true
vim.opt.expandtab = false

-- Search settings (case (in)sensitivity)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
