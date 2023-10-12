-- Plugin manager bootstrap & configuration

-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Lazy remaps
vim.keymap.set("n", "<leader>pm", vim.cmd.Lazy)

local options = {
	change_detection = {
		enabled = false,
		notify = false,
	},

	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"tohtml",
				"gzip",
				"netrwPlugin",
				"matchit",
				"tarPlugin",
				"spellfile",
				"zipPlugin",
				"tutor",
				"rplugin",
				"man",
			},
		},
	},
}
-- Load the plugins
require("lazy").setup("nick.plugin.spec", options)