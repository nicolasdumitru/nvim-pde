-- Telescope remaps
local function remaps()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>t<Return>", builtin.builtin, { desc = "Telescope builtin" })
	vim.keymap.set("n", "<leader>f<Return>", builtin.find_files, { desc = "Search files" })
	vim.keymap.set("n", "<leader>r<Return>", builtin.git_files, { desc = "Search files in git repo" })
	vim.keymap.set("n", "<leader>g<Return>", builtin.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Grep the string under the cursor" })
	vim.keymap.set("n", "<leader>b<Return>", builtin.buffers, { desc = "List open buffers" })
	vim.keymap.set("n", "<leader>o<Return>", builtin.buffers, { desc = "Search previously open files" })
	vim.keymap.set("n", "<leader>h<Return>", builtin.help_tags, { desc = "List help" })
	vim.keymap.set("n", "<leader>c<Return>", builtin.commands, { desc = "List plugin/user commands" })
	vim.keymap.set("n", "<leader>k<Return>", builtin.keymaps, { desc = "List normal mode keymaps" })
	vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "List LSP references" })
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = remaps,
	name = "Telescope",
}
