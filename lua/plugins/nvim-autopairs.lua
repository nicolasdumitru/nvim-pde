local function configuration ()
	require('nvim-autopairs').setup({
		disable_filetype = { "TelescopePrompt" , "vim" },
		enable_check_bracket_line = false, -- will not add a pair if it already exists on the line
		ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
	})
	-- If you want insert `(` after select function or method item
	local cmp_autopairs = require('nvim-autopairs.completion.cmp')
	local cmp = require('cmp')
	cmp.event:on(
		'confirm_done',
		cmp_autopairs.on_confirm_done()
	)
	local npairs = require("nvim-autopairs")
	local Rule = require('nvim-autopairs.rule')

	npairs.setup({
		check_ts = true,
		ts_config = {
			lua = {'string'},-- it will not add a pair on that treesitter node
			javascript = {'template_string'},
			java = false,-- don't check treesitter on java
		},
		fast_wrap = {
			map = '<M-w>',
			chars = { '{', '[', '(', '"', "'" },
			pattern = [=[[%'%"%>%]%)%}%,]]=],
			end_key = '$',
			keys = 'qwertyuiopzxcvbnmasdfghjkl',
			check_comma = true,
			manual_position = true,
			highlight = 'Search',
			highlight_grey='Comment'
		},
	})

	local ts_conds = require('nvim-autopairs.ts-conds')


	-- press % => %% only while inside a comment or string
	npairs.add_rules({
		Rule("%", "%", "lua")
			:with_pair(ts_conds.is_ts_node({'string','comment'})),
		Rule("$", "$", "lua")
			:with_pair(ts_conds.is_not_ts_node({'function'}))
	})
end

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
	config = configuration,
}
