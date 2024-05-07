return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter",
	},
	event = "VeryLazy",
	config = {
		provider_selector = function(bufnr, filetype, buftype)
			return { "lsp", "indent" }
		end,
	},
}
