local function configuration()
	-- This feature will not work if the plugin is lazy-loaded
	vim.g.lf_netrw = 1

	require("lf").setup({
		default_action = "drop", -- default action when `Lf` opens a file
		default_actions = { -- default action keybindings
			["<C-t>"] = "tabedit",
			["<C-x>"] = "split",
			["<C-v>"] = "vsplit",
		},

		escape_quit = false,
		border = "rounded",

		winblend = 0,
		dir = nil,
		direction = "float",
	})

	vim.keymap.set("n", "<M-o>", "<Cmd>Lf<CR>")
	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = "LfTermEnter",
		callback = function(a)
			vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
		end,
	})
end

return {
	-- Sample configuration is supplied
	"lmburns/lf.nvim",
	dependencies = { "akinsho/toggleterm.nvim" },
	config = configuration,
	event = "VeryLazy",
}
