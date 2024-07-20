return {
	"declancm/cinnamon.nvim",
	event = { "VimEnter" },
	config = function()
		require("cinnamon").setup({
			keymaps = {
				basic = true,
				extra = true,
			},
			options = { mode = "window" },
		})
	end,
}
