local function configuration()
	vim.keymap.set("n", "<A-u>", vim.cmd.UndotreeToggle)
end

return {
	"mbbill/undotree",
	name = "undotree",
	config = configuration,
	event = "VeryLazy",
}
