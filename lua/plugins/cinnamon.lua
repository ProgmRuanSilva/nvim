return {
	"declancm/cinnamon.nvim",
	event = { "VimEnter" },
	config = {
		-- KEYMAPS:
		default_keymaps = false, -- Create default keymaps.
		extra_keymaps = false, -- Create extra keymaps.
		extended_keymaps = false, -- Create extended keymaps.
		override_keymaps = true, -- The plugin keymaps will override any existing keymaps.

		-- OPTIONS:
		always_scroll = true, -- Scroll the cursor even when the window hasn't scrolled.
		centered = true, -- Keep cursor centered in window when using window scrolling.
		disabled = false, -- Disables the plugin.
		default_delay = 7, -- The default delay (in ms) between each line when scrolling.
		hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
		horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
		max_length = -1, -- Maximum length (in ms) of a command. The line delay will be
		-- re-calculated. Setting to -1 will disable this option.
		scroll_limit = 150, -- Max number of lines moved before scrolling is skipped. Setting
		-- to -1 will disable this option. extra_keymaps = true,
		-- DEFAULT_KEYMAPS:

		--Screen scrolling:
		-- vim.keymap.set("n", "z.", "<Cmd>lua Scroll('z.', 0, 1)<CR>"),
		-- vim.keymap.set("n", "z<CR>", "<Cmd>lua Scroll('zt^', 0, 1)<CR>"),
		-- vim.keymap.set("n", "z-", "<Cmd>lua Scroll('z-', 0, 1)<CR>"),
		-- vim.keymap.set("n", "z^", "<Cmd>lua Scroll('z^', 0, 1)<CR>"),
		-- vim.keymap.set("n", "z+", "<Cmd>lua Scroll('z+', 0, 1)<CR>"),
		-- vim.keymap.set("n", "<C-y>", "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>"),
		-- vim.keymap.set("n", "<C-e>", "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>"),

		-- Horizontal screen scrolling:
		-- vim.keymap.set("n", "zH", "<Cmd>lua Scroll('zH')<CR>"),
		-- vim.keymap.set("n", "zL", "<Cmd>lua Scroll('zL')<CR>"),
		-- vim.keymap.set("n", "zs", "<Cmd>lua Scroll('zs')<CR>"),
		-- vim.keymap.set("n", "ze", "<Cmd>lua Scroll('ze')<CR>"),
		-- vim.keymap.set("n", "zh", "<Cmd>lua Scroll('zh', 0, 1)<CR>"),
		-- vim.keymap.set("n", "zl", "<Cmd>lua Scroll('zl', 0, 1)<CR>"),

		-- Start/end of line:
		-- vim.keymap.set({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
		-- vim.keymap.set({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
		-- vim.keymap.set({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

		-- Paragraph movements:
		-- vim.keymap.set({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
		-- vim.keymap.set({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

		-- Previous/next search result:
		-- vim.keymap.set("v", "n", "<Cmd>lua Scroll('n', 1)<CR>")
		-- vim.keymap.set("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
		-- vim.keymap.set("n", "*", "<Cmd>lua Scroll('*', 1)<CR>"),
		-- vim.keymap.set("n", "#", "<Cmd>lua Scroll('#', 1)<CR>"),
		-- vim.keymap.set("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>"),
		-- vim.keymap.set("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>"),

		-- -- Previous/next cursor location:
		-- vim.keymap.set("n", "<C-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>"),
		-- vim.keymap.set("n", "<C-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>"),
		-- LSP_KEYMAPS:

		-- LSP go-to-definition:
		-- vim.keymap.set("n", "gd", "<Cmd>lua Scroll('definition')<CR>"),

		-- LSP go-to-declaration:
		-- vim.keymap.set("n", "gD", "<Cmd>lua Scroll('declaration')<CR>"),
	},
}
