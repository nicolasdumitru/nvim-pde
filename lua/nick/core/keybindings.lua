-- Keybindings

-- Leader and LocalLeader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Change directory to `dir` and print the current working directory
local function cdpwd(dir)
	return function()
		vim.cmd.cd(dir)
		vim.cmd.pwd()
	end
end

-- Open a terminal in the directory of the current file
local function terminalhere()
	return function()
		vim.cmd.cd("%:p:h")
		vim.cmd("!" .. TERM .. " & disown")
		vim.cmd.mode()
	end
end
-- `cd` to the directory of the currently edited file
vim.keymap.set("n", "<leader>cd", cdpwd("%:p:h"))
-- `cd` up a directory
vim.keymap.set("n", "<leader>c.", cdpwd(".."))
-- `cd` to $XDG_CONFIG_HOME
vim.keymap.set("n", "<leader>cf", cdpwd(XDG_CONFIG_HOME))
-- `cd` to the neovim configuration directory ($XDG_CONFIG_HOME/nvim)
vim.keymap.set("n", "<leader>cn", cdpwd(nvim_config_dir))
-- `cd` to the 'code' directory
vim.keymap.set("n", "<leader>co", cdpwd(code))

-- Open an external terminal in the working directory of the currently edited file
vim.keymap.set("n", "<leader>tt", terminalhere())

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
