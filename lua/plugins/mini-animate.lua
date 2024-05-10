return {
	"echasnovski/mini.animate",
	event = "VimEnter",
	config = function()
		-- local animate = require("mini.animate")
		require("mini.animate").setup({
			cursor = {
				enable = true,
				-- timing = animate.gen_timing.linear({ duration = 85, unit = "total" }),
			},
			scroll = {
				enable = false,
			},
			close = {
				enable = false,
			},
			open = {
				enable = false,
			},
			resize = {
				enable = false,
			},
		})
	end,
}
