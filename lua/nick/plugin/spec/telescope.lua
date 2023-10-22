local function configuration()
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<Leader>t<Leader>", builtin.builtin, { desc = "Telescope builtin" })
	vim.keymap.set("n", "<Leader>f<Leader>", builtin.find_files, { desc = "Search files" })
	vim.keymap.set("n", "<Leader>r<Leader>", builtin.git_files, { desc = "Search files in git repo" })
	vim.keymap.set("n", "<Leader>g<Leader>", builtin.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<Leader>gs<Leader>", builtin.grep_string, { desc = "Grep the string under the cursor" })
	vim.keymap.set("n", "<Leader>b<Leader>", builtin.buffers, { desc = "List open buffers" })
	vim.keymap.set("n", "<Leader>o<Leader>", builtin.buffers, { desc = "Search previously open files" })
	vim.keymap.set("n", "<Leader>h<Leader>", builtin.help_tags, { desc = "List help" })
	vim.keymap.set("n", "<Leader>c<Leader>", builtin.commands, { desc = "List plugin/user commands" })
	vim.keymap.set("n", "<Leader>k<Leader>", builtin.keymaps, { desc = "List normal mode keymaps" })
	vim.keymap.set("n", "<Leader>lr<Leader>", builtin.lsp_references, { desc = "List LSP references" })
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	name = "Telescope",
	event = "VeryLazy",
	config = configuration,
}
