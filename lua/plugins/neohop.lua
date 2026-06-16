return {
	"progmruansilva/neohop.nvim",
	event = { "VeryLazy" },
	config = function()
		require("hop").setup({
			keys = "eovqpdgflhckisuran",
			quit_key = "<SPC>",
			multi_windows = true,
		})
	end,
}
