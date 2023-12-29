local function configuration()
	local lsp_zero = require("lsp-zero")

	lsp_zero.on_attach(function(client, bufnr)
		lsp_zero.default_keymaps({ buffer = bufnr })
		local opts = { buffer = bufnr }

		-- LSP formatting
		vim.keymap.set({ "n", "v" }, "<LocalLeader>==", function()
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end, { desc = "Format the buffer (n)/selection (v) with the LSP" }, opts)

		-- LSP variable renaming
		vim.keymap.set("n", "<LocalLeader>%s", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename a variable with the LSP (all LSP references)" }, opts)
	end)

	lsp_zero.set_sign_icons({
		error = '', --  
		warn = '󰀦', -- 󰀦 󰀪
		hint = '󰌵', -- 󰌵 󰌶 
		info = '󰋼' -- 󰋼 
	})

	require("lspconfig").clangd.setup {}
	require("lspconfig").rust_analyzer.setup {}
	require('lspconfig')['hls'].setup {
		filetypes = { 'haskell', 'lhaskell', 'cabal' },
	}
	require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
	require("lspconfig").bashls.setup {}
	require("lspconfig").pyright.setup {}
	require("lspconfig").svls.setup {}
	require("lspconfig").nixd.setup {}

	-- nvim-cmp configuration
	local cmp = require("cmp")
	local cmp_format = lsp_zero.cmp_format()

	local lspkind = require("lspkind")

	cmp.setup({
		preselect = "item",
		completion = {
			completeopt = "menu,menuone,noinsert"
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},
		mapping = cmp.mapping.preset.insert({
			-- scroll up and down the documentation window
			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),

			-- confirm completion
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = function() return math.min(math.floor(0.45 * vim.o.columns), 45) end,
				preset = 'codicons',
				ellipsis_char = '...', -- must define maxwidth first
			})
		}
	})

	vim.cmd.LspStart()
end

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "onsails/lspkind.nvim" },
	},
	config = configuration,
	name = "LSP Zero",
	event = "VeryLazy",
}
