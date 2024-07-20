local options = {
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		sh = { "bashls" },
		zsh = { "bashls" },
		bash = { "bashls" },
		ruby = { "solargraph" },
		erb = { "erb_formatter" },
		eruby = { "erb_formatter" },
		crystal = { "crystal " },
	},
	formatters = {
		crystal = {
			command = "crystal",
			args = { "tool", "format", "$FILENAME" },
			stdin = false,
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
}

require("conform").setup(options)
