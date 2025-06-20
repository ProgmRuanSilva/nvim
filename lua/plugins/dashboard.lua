-- return {}
return {
	"nvimdev/dashboard-nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	opts = {
		theme = "hyper",
		disable_move = true,
		shortcut_type = "number",
		config = {
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			week_header = {
				enable = true,
				project = {
					enable = false,
				},
			},
			shortcut = {
				{ desc = "󰊳 Check updates", group = "@property", action = "Lazy check", key = "c" },
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "Telescope oldfiles",
					key = "f",
				},
				{
					desc = "  Pull requests",
					group = "Branches",
					action = "Octo pr list",
					key = "l",
				},
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Issues",
					group = "Label",
					action = "Octo issue list",
					key = "i",
				},
			},
		},
	},
}
