return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("dracula").setup({
				transparent_bg = true,
				lualine_bg_color = "NONE",
				overrides = function(colors)
					return {
						BufferLineFill = { bg = "NONE" },
						BufferLineBackground = { bg = "NONE" },
						BufferLineSeparator = { fg = "NONE", bg = "NONE" },
						BufferLineSeparatorSelected = { fg = "NONE", bg = "NONE" },
					}
				end,
			})
			vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		"NvChad/ui",
		lazy = false,
		config = function()
			local config = require("nvconfig")
			config.base46.theme = "chadracula"
			config.ui.statusline.separator_style = "round"
			config.ui.tabufline.enabled = false
			config.nvdash.load_on_startup = false
			config.colorify.enabled = false
			config.lsp.signature = false

			pcall(dofile, vim.g.base46_cache .. "statusline")
			require("nvchad")
		end,
	},
	{
		"NvChad/base46",
		lazy = false,
		build = function()
			local config = require("nvconfig")
			config.base46.theme = "chadracula"
			require("base46").load_all_highlights()
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		opts = {
			options = {
				mode = "buffers",
				always_show_bufferline = true,
				themable = true,
			},
			highlights = {
				fill = { bg = "NONE" },
				background = { bg = "NONE" },
				tab = { bg = "NONE" },
				tab_selected = { bg = "NONE" },
				tab_separator = { bg = "NONE" },
				tab_separator_selected = { bg = "NONE" },
				buffer_visible = { bg = "NONE" },
				buffer_selected = { bg = "NONE" },
				numbers = { bg = "NONE" },
				numbers_visible = { bg = "NONE" },
				numbers_selected = { bg = "NONE" },
				diagnostic = { bg = "NONE" },
				diagnostic_visible = { bg = "NONE" },
				diagnostic_selected = { bg = "NONE" },
				hint = { bg = "NONE" },
				hint_visible = { bg = "NONE" },
				hint_selected = { bg = "NONE" },
				hint_diagnostic = { bg = "NONE" },
				hint_diagnostic_visible = { bg = "NONE" },
				hint_diagnostic_selected = { bg = "NONE" },
				info = { bg = "NONE" },
				info_visible = { bg = "NONE" },
				info_selected = { bg = "NONE" },
				info_diagnostic = { bg = "NONE" },
				info_diagnostic_visible = { bg = "NONE" },
				info_diagnostic_selected = { bg = "NONE" },
				warning = { bg = "NONE" },
				warning_visible = { bg = "NONE" },
				warning_selected = { bg = "NONE" },
				warning_diagnostic = { bg = "NONE" },
				warning_diagnostic_visible = { bg = "NONE" },
				warning_diagnostic_selected = { bg = "NONE" },
				error = { bg = "NONE" },
				error_visible = { bg = "NONE" },
				error_selected = { bg = "NONE" },
				error_diagnostic = { bg = "NONE" },
				error_diagnostic_visible = { bg = "NONE" },
				error_diagnostic_selected = { bg = "NONE" },
				modified = { bg = "NONE" },
				modified_visible = { bg = "NONE" },
				modified_selected = { bg = "NONE" },
				duplicate_selected = { bg = "NONE" },
				duplicate_visible = { bg = "NONE" },
				duplicate = { bg = "NONE" },
				separator_selected = { bg = "NONE" },
				separator_visible = { bg = "NONE" },
				separator = { bg = "NONE" },
				indicator_visible = { bg = "NONE" },
				indicator_selected = { bg = "NONE" },
				pick_selected = { bg = "NONE" },
				pick_visible = { bg = "NONE" },
				pick = { bg = "NONE" },
				offset_separator = { bg = "NONE" },
				trunc_marker = { bg = "NONE" },
			},
		},
	},
	{
		"declancm/cinnamon.nvim",
		event = { "VeryLazy" },
		config = function()
			require("cinnamon").setup({
				keymaps = {
					basic = false,
					extra = false,
				},
				options = { mode = "window" },
			})
		end,
	},
	{ "nvzone/volt", event = "VeryLazy", lazy = true },
	{ "nvzone/menu", event = "VeryLazy", lazy = true },
}
