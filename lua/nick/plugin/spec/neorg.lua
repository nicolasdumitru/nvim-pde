local function configuration()
	require("neorg").setup {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {
				config = {
					folds = true,
					icon_preset = "basic",
				}
			},        -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/notes",
					},
					default_workspace = "notes",
				},
			},
		},
		vim.keymap.set("n", "<leader>nx", "<CMD>Neorg index<CR>"),
		vim.keymap.set("n", "<localleader>ct", "<CMD>Neorg toggle-concealer<CR>"),
	}
end

return {
	"nvim-neorg/neorg",
	name = "Neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = configuration,
	lazy = true,
	ft = "norg",
	keys = "<leader>nx",
	cmd = "Neorg"
}
