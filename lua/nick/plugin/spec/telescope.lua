local function configuration()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<Leader>st", builtin.builtin, { desc = "Telescope builtin" })
	vim.keymap.set("n", "<Leader>sf", builtin.find_files, { desc = "Search files" })
	vim.keymap.set("n", "<Leader>sr", builtin.git_files, { desc = "Search files in git repo" })
	vim.keymap.set("n", "<Leader>lg", builtin.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<Leader>gs", builtin.grep_string, { desc = "Grep the string under the cursor" })
	vim.keymap.set("n", "<Leader>sb", builtin.buffers, { desc = "List open buffers" })
	vim.keymap.set("n", "<Leader>so", builtin.oldfiles, { desc = "Search previously open files" })
	vim.keymap.set("n", "<Leader>sh", builtin.help_tags, { desc = "List help" })
	vim.keymap.set("n", "<Leader>sc", builtin.commands, { desc = "List plugin/user commands" })
	vim.keymap.set("n", "<Leader>sk", builtin.keymaps, { desc = "List normal mode keymaps" })
	vim.keymap.set("n", "<Leader>lr", builtin.lsp_references, { desc = "List LSP references" })
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	name = "Telescope",
	event = "VeryLazy",
	config = configuration,
}
