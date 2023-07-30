-- Telescope remaps
local function remaps()
	local builtin = require("telescope.builtin")
	--vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader><Return>", builtin.find_files, {})
	vim.keymap.set("n", "<leader>r<Return>", builtin.git_files, {})
	vim.keymap.set("n", "<leader>g<Return>", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>b<Return>", builtin.buffers, {})
	vim.keymap.set("n", "<leader>h<Return>", builtin.help_tags, {})
	vim.keymap.set("n", "<leader>c<Return>", builtin.commands, {})
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = remaps,
	name = "Telescope",
}
