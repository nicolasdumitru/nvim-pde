local keybindings = {
	{
		"s",
		mode = { "n", "x", "o" },
		function()
			vim.cmd.nohlsearch()
			vim.cmd.diffupdate()
			require("flash").jump()
		end,
		desc = "Flash"
	},
	{
		"S",
		mode = { "n", "x", "o" },
		function() require("flash").treesitter() end,
		desc = "Flash Treesitter"
	},
	{
		"r",
		mode = "o",
		function() require("flash").remote() end,
		desc = "Remote Flash"
	},
	{
		"R",
		mode = { "o", "x" },
		function() require("flash").treesitter_search() end,
		desc = "Treesitter Search"
	},
	{
		"<c-s>",
		mode = { "c" },
		function() require("flash").toggle() end,
		desc = "Toggle Flash Search"
	},
}

local options = {
	highlight = {
		backdrop = true,
	},
	label = {
		rainbow = {
			enabled = true,
			-- number between 1 and 9
			shade = 5,
		},
	},
	modes = {
		char = {
			highlight = {
				backdrop = true,
			},
		},
	},
}

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = options,
	keys = keybindings,
}
