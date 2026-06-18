return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = {
			options = {
				theme = "dracula",
			},
		},
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
}
