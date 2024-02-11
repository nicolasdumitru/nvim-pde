local function configuration()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
			border = true,
		},
		pickers = {
			commands = {
				theme = "ivy",
			},
		},
		extensions = {
			file_browser = {
				hijack_netrw = true,
			},
		},
	})

	local fb = telescope.load_extension("file_browser")

	local palette = require("nick.core.highlights.gruvbox")

	local highlight_groups = {
		{ "TelescopeMatching",      { fg = palette.bright_orange, underline = true } },
		{ "TelescopeSelection",     { bg = palette.dark1 } }, -- gitsigns
		{ "TelescopeNormal",        { fg = palette.light1, bg = palette.dark0 } },
		{ "TelescopePromptNormal",  { bg = palette.dark1 } }, -- gitsigns
		{ "TelescopeResultsBorder", { fg = palette.dark0, bg = palette.dark0 } },
		{ "TelescopePreviewBorder", { fg = palette.dark0, bg = palette.dark0 } },
		{ "TelescopePromptBorder",  { fg = palette.dark1, bg = palette.dark1 } },
		{ "TelescopePromptTitle",   { fg = palette.dark1, bg = palette.bright_blue } },
		{ "TelescopeResultsTitle",  { fg = palette.dark1, bg = palette.bright_aqua } },
		{ "TelescopePreviewTitle",  { fg = palette.dark1, bg = palette.bright_aqua } },
	}

	for _, hl in pairs(highlight_groups) do
		vim.api.nvim_set_hl(0, hl[1], hl[2])
	end

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<Leader>st", builtin.builtin,
		{ desc = "Telescope builtin" })
	vim.keymap.set("n", "<Leader>sf", builtin.find_files,
		{ desc = "Search files" })
	vim.keymap.set("n", "<Leader>sr", builtin.git_files,
		{ desc = "Search files in git repo" })
	vim.keymap.set("n", "<Leader>sg", builtin.live_grep, { desc = "Live grep" })
	vim.keymap.set("n", "<Leader>/",
		function()
			builtin.current_buffer_fuzzy_find(
				require('telescope.themes').get_dropdown())
		end,
		{ desc = "Current buffer fuzzy find" })
	vim.keymap.set("n", "<Leader>sb", builtin.buffers,
		{ desc = "List open buffers" })
	vim.keymap.set("n", "<Leader>so", builtin.oldfiles,
		{ desc = "Search previously open files" })
	vim.keymap.set("n", "<Leader>sh", builtin.help_tags, { desc = "List help" })
	vim.keymap.set("n", "<Leader>:", builtin.commands,
		{ desc = "List plugin/user commands" })
	vim.keymap.set({ "n", "i" }, "<M-x>", builtin.commands,
		{ desc = "List plugin/user commands" })
	vim.keymap.set("n", "<Leader>sk", builtin.keymaps,
		{ desc = "List normal mode keymaps" })
	vim.keymap.set("n", "<Leader>slr", builtin.lsp_references,
		{ desc = "List LSP references" })
	vim.keymap.set("n", "<Leader>fm", fb.file_browser,
		{ desc = "telescope-file-browser" })
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	name = "Telescope",
	event = "VeryLazy",
	config = configuration,
}
