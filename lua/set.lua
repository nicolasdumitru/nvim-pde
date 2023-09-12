-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Line/column highlighting
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Indentation settings
local tab_width = 4
vim.opt.shiftwidth = tab_width
vim.opt.softtabstop = tab_width
vim.opt.tabstop = tab_width
vim.opt.varsofttabstop = nil
vim.opt.vartabstop = nil
vim.opt.smartindent = true
vim.opt.expandtab = false

-- List mode (show invisible characters)
vim.opt.list = true

-- Search settings (case (in)sensitivity)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Minimum amount of lines above and below cursor
vim.opt.scrolloff = 4

-- Update time
vim.opt.updatetime = 50

-- Remember changes between sessions
vim.opt.undofile = true

-- Use a swapfile for the buffer
vim.opt.swapfile = true

-- Hidden (hide abbandoned buffers)
vim.opt.hidden = true

-- Split rightward and downward
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Open all folds
vim.opt.foldenable = false

-- Tildeop (make tilde "~" behave like an operator)
vim.opt.tildeop = true

-- Window title
vim.opt.title = true
