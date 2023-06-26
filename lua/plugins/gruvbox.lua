-- Gruvbox theme options
-- setup must be called before loading the colorscheme

local function configuration ()
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {
				neutral_green =  "#32db7a",
				neutral_red = "#e7143c",
			},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.o.background = "dark" -- or "light" for light mode
	end


return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = configuration,
}
