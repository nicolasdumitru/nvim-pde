local function configuration()
	require("toggleterm").setup {
		-- size can be a number or function which is passed the current terminal
		size = 15,
		open_mapping = [[<A-CR>]],
		hide_numbers = true, -- hide the number column in toggleterm buffers
		autochdir = true,  -- when neovim changes it current directory the terminal will change it's own when next it's opened
		shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
		shading_factor = '-30', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		direction = "horizontal",
	}
end

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = configuration,
}
