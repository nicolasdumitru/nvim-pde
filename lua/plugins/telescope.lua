-- Telescope remaps
local function remaps ()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
	vim.keymap.set("n", "<leader>gr", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {"nvim-lua/plenary.nvim"},
	config = remaps,
	name = "Telescope",
	}
