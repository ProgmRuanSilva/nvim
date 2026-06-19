return {
	"rcarriga/nvim-notify",
	event = "VimEnter",
	opts = function()
		require("notify").presets.minimal, vim.notify = require("notify")
	end,

	config = {
		background_colour = "#000000",
	},
}
