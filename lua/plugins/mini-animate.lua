return {
	"echasnovski/mini.animate",
	event = "VimEnter",
	config = function()
		require("mini.animate").setup({
			cursor = {
				enable = false,
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
				enable = true,
			},
		})
	end,
}
