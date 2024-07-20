return {
	"kristijanhusak/vim-dadbod-ui",
	event = "VeryLazy",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
		"DBUIRenameBuffer",
		"DBUILastQueryInfo",
		"DBUIHideNotifications",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 25
		vim.g.db_ui_show_database_icon = 1
		vim.g.db_ui_use_nvim_notify = 1
	end,
	config = function()
		require("plugins.dadbod")
	end,
}
