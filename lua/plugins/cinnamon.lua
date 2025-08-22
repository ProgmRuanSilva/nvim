return {
	"declancm/cinnamon.nvim",
	event = { "VimEnter" },
	config = function()
		require("cinnamon").setup({
			keymaps = {
				basic = false,
				extra = false,
			},
			options = { mode = "window" },
		})
	end,
}
