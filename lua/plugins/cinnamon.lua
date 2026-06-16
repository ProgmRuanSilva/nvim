-- return {}
return {
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
}
