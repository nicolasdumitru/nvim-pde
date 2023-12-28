local function configuration()
	require("telescope").load_extension("file_browser")
end

return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = configuration,
}
