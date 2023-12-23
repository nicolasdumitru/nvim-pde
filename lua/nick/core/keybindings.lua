-- Keybindings

-- Leader and LocalLeader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- the Current File's Directory
local cfd = "%:p:h"

-- `cd` to `dir` and print the current working directory
local function cd_pwd(dir)
	vim.cmd.cd(dir)
	vim.cmd.pwd()
end

-- Open an external terminal in the directory of the currently edited file
local function open_terminal_here()
	vim.cmd.cd(cfd)
	vim.fn.system(TERM .. " & disown")
	vim.cmd.mode()
end

-- `cd` to the root of the currently edited file's repository
local function cd_repository_root()
	vim.cmd.cd(cfd)
	cd_pwd(vim.fn.trim(vim.fn.system("git rev-parse --show-toplevel")))
end

-- `cd keybindings`
vim.keymap.set("n", "<leader>cd<Return>", function() cd_pwd(HOME) end,
	{ desc = "`cd` to $HOME" })
vim.keymap.set("n", "<leader>cdf", function() cd_pwd(cfd) end,
	{ desc = "`cd` to the directory of the currently edited file" })
vim.keymap.set("n", "<leader>cd.", function() cd_pwd("..") end,
	{ desc = "`cd` up a directory" })
vim.keymap.set("n", "<leader>cdrr", function() cd_repository_root() end,
	{ desc = "`cd` to the root of the git repository of the currently edited file" })
vim.keymap.set("n", "<leader>cdcf", function() cd_pwd(XDG_CONFIG_HOME) end,
	{ desc = "`cd` to $XDG_CONFIG_HOME" })
vim.keymap.set("n", "<leader>cdco", function() cd_pwd(code) end,
	{ desc = "`cd` to the 'code' directory" })

-- Open an external terminal in the directory of the currently edited file
vim.keymap.set("n", "<leader>tt", function() open_terminal_here() end,
	{ desc = "" })

-- System clipboard remaps
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]],
	{ desc = "Yank (copy) text into the system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+y$]],
	{ desc = "Yank (copy) text into the system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]],
	{ desc = "Delete (cut) text into the system clipboard" })
vim.keymap.set("n", "<leader>D", [["+D]],
	{ desc = "Delete (cut) text into the system clipboard" })

-- Black hole register remaps
vim.keymap.set({ "n", "v" }, "<leader>c", [["_d]],
	{ desc = "Delete text without copying it" })
vim.keymap.set("n", "<leader>C", [["_D]],
	{ desc = "Delete text without copying it" })
vim.keymap.set("x", "<leader>p", [["_dP]],
	{ desc = "Keep the copied text in register when pasting over a highlight" })

-- Move lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Splits remaps
-- Navigate splits quickly in normal and insert mode
--vim.keymap.del("n", "n")
--vim.keymap.set({ "n", "o", "t" }, "h", "h", { silent = true })
vim.keymap.set({ "n", "o", "t" }, "n", "j", { silent = true })
vim.keymap.set({ "n", "o", "t" }, "e", "k", { silent = true })
vim.keymap.set({ "n", "o", "t" }, "i", "l", { silent = true })
-- Move splits quickly in normal mode
vim.keymap.set({ "n", "i" }, "<A-H>", "<Cmd>wincmd H <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-J>", "<Cmd>wincmd J <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-K>", "<Cmd>wincmd K <CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<A-L>", "<Cmd>wincmd L <CR>", { silent = true })
-- Resize splits quickly in normal mode
vim.keymap.set({ "n", "i", "t" }, "<A-=>", "<Cmd>wincmd = <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-m>", "<Cmd>wincmd | <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Left>", "<Cmd>vertical resize -2 <CR>",
	{ silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Down>", "<Cmd>resize -1 <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Up>", "<Cmd>resize +1 <CR>", { silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-Right>", "<Cmd>vertical resize +2 <CR>",
	{ silent = true })

-- This is for terminals that pass ctrl-backspace as <C-BS> instead of <C-w> to Neovim
vim.keymap.set("i", "<C-BS>", "<C-G>u<C-W>",
	{ desc = "Set a new undo point and delete a word with ctrl-backspace in insert mode" })

-- The remaps below improve the behavior of already existent mappings.

-- Keep the cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "M<C-d>zz")
vim.keymap.set("n", "<C-u>", "M<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
--vim.keymap.set("n", "n", "nzz") -- or "nzzzv"
--vim.keymap.set("n", "N", "Nzz") -- or "Nzzzv"

-- Keep the cursor in the same place when appending lines
vim.keymap.set("n", "J", "mzJ`z")

-- Default bindings that I'd like to make sure I keep regardless of potential future updates
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("i", "<C-U>", "<C-G>u<C-U>",
	{ desc = "Set a new undo point and delete a line with ctrl-u in insert mode" })
vim.keymap.set("i", "<C-W>", "<C-G>u<C-W>",
	{ desc = "Set a new undo point and delete a word with ctrl-w in insert mode" })
