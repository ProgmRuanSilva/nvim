local conf = require("nvchad.configs.cmp")
local cmp = require("cmp")

conf.mapping = {
	["<A-v>"] = cmp.mapping.complete(),
	-- ["<A-l>"] = cmp.mapping.select_prev_item(),
	["<A-k>"] = cmp.mapping.select_next_item(),
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<A-l>"] = cmp.mapping.close(),
	["<A-j>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
	["<Tab>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
	-- ["<Tab>"] = cmp.mapping(function(fallback)
	-- 	if cmp.visible() then
	-- 		cmp.select_next_item()
	-- 	elseif require("luasnip").expand_or_jumpable() then
	-- 		vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
	-- 	else
	-- 		fallback()
	-- 	end
	-- end, {
	-- 	"i",
	-- 	"s",
	-- }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif require("luasnip").jumpable(-1) then
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
		else
			fallback()
		end
	end, {
		"i",
		"s",
	}),
}
conf.sources = {
	{ name = "vim-dadbod-completion" },
	{ name = "L3MON4D3/LuaSnip" },
	{ name = "hrsh7th/cmp-nvim-lsp" },
	{ name = "saadparwaiz1/cpm_luasnip" },
	{ name = "luasnip" },
	{ name = "nvim_lsp", trigger_characters = { "-" } },
	{ name = "nvim_lua" },
	{ name = "path" },
	{ name = "buffer" },
	{ name = "Exafunction/codeium.vim" },
}
conf.experimental = {
	ghost_text = {
		hl_group = "CmpGhostText",
	},
}

return conf
