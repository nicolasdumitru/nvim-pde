local function configuration ()
	require("autoclose").setup({
		options = {
			disabled_filetypes = { "TelescopePrompt", "text", "markdown" },
			disable_when_touch = true,
		},
		keys = {
			["\\\""] = { escape = false, close = false },
		},
	})
end

return {
	"m4xshen/autoclose.nvim",
	config = configuration,
}
