local function configuration()
	vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiffsplit)
	vim.keymap.set("n", "<leader>gv", vim.cmd.Gvdiffsplit)
	vim.keymap.set("n", "<leader>gh", vim.cmd.Ghdiffsplit)
end
return {
	"tpope/vim-fugitive",
	name = "Fugitive",
	config = configuration,
	event = "VeryLazy",
}
