local org_directory = {}

org_directory.root = HOME .. "/org/"
--org_directory.archive = org_directory.root .. "archive/"

local function configuration()
	local org = require("orgmode")
	-- Load treesitter grammar for org
	org.setup_ts_grammar()

	-- Setup treesitter
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "org" },
		},
		ensure_installed = { "org" },
	})

	-- Setup orgmode
	org.setup({
		org_agenda_files = org_directory.root .. "**/*",
		org_default_notes_file = org_directory.root .. "refile.org",
		org_capture_templates = {
			-- TODO: add useful templates (maybe for backlog) and remove this one
			r = {
				description = "Repo",
				template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
				target = org_directory.root .. "repos.org",
			}
		},
		org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
		org_todo_keyword_faces = {
			WAITING = ":weight bold",
			DELEGATED = ":slant italic :underline on",
		},
		--org_archive_location = org_directory.archive .. "%s_archive",
	})
end

return {
	"nvim-orgmode/orgmode",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
	},
	event = "VeryLazy",
	config = configuration,
}
