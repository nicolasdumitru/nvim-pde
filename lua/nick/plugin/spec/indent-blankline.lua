local function configuration()
	require("ibl").setup({
		indent = {
			-- these are slightly different
			char = '┃', -- center aligned
			tab_char = '▎', -- left aligned
		}
	})
end

return
{
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = configuration,
	lazy = true,
	event = "VeryLazy",
}
