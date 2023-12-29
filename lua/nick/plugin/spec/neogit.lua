local function configuration()
	require("neogit").setup()
	vim.keymap.set("n", "<leader>gd", function() vim.cmd.Neogit("diff") end)
end

return {
	"NeogitOrg/neogit",
	name = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	config = configuration,
	event = "VeryLazy",
}
