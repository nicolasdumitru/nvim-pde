local function configuration()
	local lsp = require("lsp-zero").preset({
		{
			float_border = "rounded",
			call_servers = "local",
			configure_diagnostics = true,
			setup_servers_on_start = true,
			set_lsp_keymaps = {
				preserve_mappings = false,
				omit = {},
			},
			manage_nvim_cmp = {
				set_sources = "recommended",
				set_basic_mappings = true,
				set_extra_mappings = false,
				use_luasnip = true,
				set_format = true,
				documentation_window = true,
			},
		}
	})

	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
		local opts = { buffer = bufnr }

		-- LSP formatting
		vim.keymap.set({ "n", "v" }, "<LocalLeader>==", function()
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end, { desc = "Format the buffer (n)/selection (v) with the LSP" }, opts)

		-- LSP variable renaming
		vim.keymap.set("n", "<LocalLeader>%s", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename a variable with the LSP (all LSP references)"}, opts)
	end)

	lsp.ensure_installed({
		"clangd",
		"rust_analyzer",
		"lua_ls",
		"bashls",
	})

	require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

	lsp.setup()

	-- nvim-cmp configuration
	-- Make sure you setup `cmp` after lsp-zero
	local cmp = require("cmp")
	local cmp_action = require("lsp-zero").cmp_action()

	cmp.setup({
		preselect = "item",
		completion = {
			completeopt = "menu,menuone,noinsert"
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},
		mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp_action.tab_complete(),
			["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
		},
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{                      -- Optional
			"williamboman/mason.nvim",
			build = pcall(vim.cmd.MasonUpdate)
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },            -- Required
		{ "hrsh7th/cmp-nvim-lsp" },        -- Required
		{ "L3MON4D3/LuaSnip" },            -- Required
	},
	config = configuration,
	name = "LSP Zero",
	event = "VeryLazy",
}
