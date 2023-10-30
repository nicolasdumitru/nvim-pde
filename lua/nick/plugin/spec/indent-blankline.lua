local function configuration()
	require("ibl").setup({
		indent = {
			char = "┃",
			tab_char = "▎",
		}
	})
end

return
{
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = configuration,
}
