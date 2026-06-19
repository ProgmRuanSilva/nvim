return {
	"saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_and_accept", "fallback" },
			["<C-k>"] = { "select_next", "fallback" },
			["<C-l>"] = { "select_prev", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			menu = { border = "rounded" },
			documentation = { auto_show = true, auto_show_delay_ms = 200, window = { border = "rounded" } },
		},
		signature = {
			window = { border = "rounded" },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "codeium" },
			providers = {
				codeium = { name = "Codeium", module = "codeium.blink", async = true },
			},
		},
	},
}
