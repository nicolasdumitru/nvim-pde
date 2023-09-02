-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Line/column highlighting
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

-- Indentation settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = false

-- List mode (show invisible characters)
vim.opt.list = true

-- Search settings (case (in)sensitivity)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Colors
vim.opt.termguicolors = true

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

-- Window title
vim.opt.title = true
