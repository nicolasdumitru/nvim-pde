-- Keybindings

-- Leader and LocalLeader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- the Current File's Directory
local cfd = "%:p:h"

-- `cd` to `dir` and print the current working directory
local function cd_pwd(dir)
	vim.cmd.lcd(dir)
	vim.cmd.pwd()
end

-- Open an external terminal in the directory of the currently edited file
local function open_terminal_here()
	vim.cmd.lcd(cfd)
	vim.fn.system(TERM .. " & disown")
	vim.cmd.mode()
end

-- `cd` to the root of the currently edited file's repository
local function cd_repository_root()
	vim.cmd.lcd(cfd)
	cd_pwd(vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel")))
end

-- `cd` to $HOME
vim.keymap.set("n", "<leader>cd<Return>", function () cd_pwd(HOME) end)
-- `cd` to the directory of the currently edited file
vim.keymap.set("n", "<leader>cdf", function () cd_pwd(cfd) end)
-- `cd` up a directory
vim.keymap.set("n", "<leader>cd.", function () cd_pwd("..") end)
-- `cd` to the root of the git repository of the currently edited file
vim.keymap.set("n", "<leader>cdrr", function () cd_repository_root() end)
-- `cd` to $XDG_CONFIG_HOME
vim.keymap.set("n", "<leader>cdcf", function () cd_pwd(XDG_CONFIG_HOME) end)
-- `cd` to the neovim configuration directory ($XDG_CONFIG_HOME/nvim end)
vim.keymap.set("n", "<leader>cdnv", function () cd_pwd(nvim_config_dir) end)
-- `cd` to the 'code' directory
vim.keymap.set("n", "<leader>cdco", function () cd_pwd(code) end)

-- Open an external terminal in the directory of the currently edited file
vim.keymap.set("n", "<leader>tt", function () open_terminal_here() end)

-- System clipboard remaps
-- Easily yank (copy) stuff into the system clipoboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+y$]])
-- Easily delete (cut) stuff into the system clipoboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

-- Black hole register remaps
-- Easily delete stuff without copying it
vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]])
vim.keymap.set("n", "<leader>C", [["_C]])
-- Keep the copied string in register when pasting over a highlight
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Splits remaps
-- Navigate splits quickly in normal and insert mode
vim.keymap.set({ "n", "i", "t" }, "<A-h>", "<Cmd>wincmd h <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-j>", "<Cmd>wincmd j <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-k>", "<Cmd>wincmd k <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-l>", "<Cmd>wincmd l <CR>", { silent = true })
-- Move splits quickly in normal mode
vim.keymap.set({ "n", "i" }, "<A-H>", "<Cmd>wincmd H <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-J>", "<Cmd>wincmd J <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-K>", "<Cmd>wincmd K <CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-L>", "<Cmd>wincmd L <CR>", { silent = true })
-- Resize splits quickly in normal mode
vim.keymap.set({ "n", "i", "t" }, "<A-=>", "<Cmd>wincmd = <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-m>", "<Cmd>wincmd | <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Left>", "<Cmd>vertical resize -2 <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Down>", "<Cmd>resize -1 <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Up>", "<Cmd>resize +1 <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Right>", "<Cmd>vertical resize +2 <CR>", { silent = true })

-- Replace a word in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set a new undo point and delete a word with ctrl-backspace in insert mode
-- (this is for terminals that pass ctrl-backspace as <C-BS> instead of <C-w> to neovim)
vim.keymap.set("i", "<C-BS>", "<C-G>u<C-W>")

--The remaps below don't really add new functionality to Neovim, they just improve the behavior of already existent mappings. They could almost be regarded as settings.

-- Keep the cursor in the middle of the screen
-- when scrolling half a page
vim.keymap.set("n", "<C-d>", "M<C-d>zz")
vim.keymap.set("n", "<C-u>", "M<C-u>zz")
-- when scrolling a full page
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
-- when viewing search results
vim.keymap.set("n", "n", "nzz") -- or "nzzzv"
vim.keymap.set("n", "N", "Nzz") -- or "Nzzzv"

-- Keep the cursor in the same place when appending lines
vim.keymap.set("n", "J", "mzJ`z")

-- Default bindings that I'd like to make sure I keep regardless of potential future updates
vim.keymap.set("n", "Y", "y$")
-- Set a new undo point and delete a line with ctrl-u in insert mode
vim.keymap.set("i", "<C-U>", "<C-G>u<C-U>")
-- Set a new undo point and delete a word with ctrl-w in insert mode
vim.keymap.set("i", "<C-W>", "<C-G>u<C-W>")
