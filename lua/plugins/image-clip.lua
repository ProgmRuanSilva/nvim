return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	cmd = "PasteImage",
	opts = {
		filetypes = {
			codecompanion = {
				prompt_for_file_name = false,
				template = "[Image]($FILE_PATH)",
				use_absolute_path = true,
			},
		},
	},
	keys = {
		{ "<leader>up", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
