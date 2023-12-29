local function configuration()
	local fb = require("telescope").load_extension("file_browser")
	vim.keymap.set("n", "<Leader>fm", fb.file_browser,
		{ desc = "telescope-file-browser" })

end

return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = configuration,
}
