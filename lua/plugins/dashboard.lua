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
					desc = " Apps",
					group = "DiagnosticHint",
					action = "Telescope zoxide list",
					key = "l",
				},
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Branches",
					group = "Label",
					action = "Telescope git_branches",
					key = "b",
				},
			},
		},
	},
}
