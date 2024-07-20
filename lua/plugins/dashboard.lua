return {
	"nvimdev/dashboard-nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	event = "VimEnter",
	config = {
		theme = "hyper",
		disable_move = true,
		config = {
			week_header = {
				enable = true,
				project = {
					enable = false,
				},
			},
			shortcut = {
				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "Telescope find_files",
					key = "f",
				},
				{
					desc = " Apps",
					group = "DiagnosticHint",
					action = "Telescope zoxide list",
					key = "l",
				},
				{
					desc = " Oldfiles",
					group = "Label",
					action = "Telescope oldfiles",
					key = "d",
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
