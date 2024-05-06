require("nvchad.mappings")
local fb_actions = require("telescope._extensions.file_browser.actions")
local fb_utils = require("telescope._extensions.file_browser.utils")
local action_state = require("telescope.actions.state")

local map = vim.keymap.set

-- Universal Utils
map({ "n", "i", "v" }, "<C-s>", "<cmd> w! <cr>")
map({ "n", "i", "v" }, "<A-q>", "<Esc>")
map({ "n", "v" }, "m", "w")
map({ "n", "v" }, "n", "b")
map({ "n", "i" }, "<A-s>", "<cmd>w!<CR>")

-- Navigation
map({ "n", "v" }, "f", "<END>")
map({ "n", "v" }, "ff", "<HOME>")
map("i", "<A-k>", "<Up>")
map("i", "<A-j>", "<Down>")
map("i", "<A-h>", "<Left>")
map("i", "<A-l>", "<Right>")
map("i", "<A-c>", "<C-o>$")
map("i", "<A-m>", "<C-o>w")
map("i", "<A-n>", "<C-o>b")

-- Insetion Utils
map("i", "<A-,>", "<")
map("i", "<A-.>", ">")
map("i", "<A-v>", "<Esc>")
map("i", "<A-o>", "<C-o>o")
map("i", "<A-b>", "<C-o><S-v>y<C-o>p")

-- Insertion Chars
map("i", "<A-9>", "()<Left>")
map("i", "<A-0>", ")<Left>")
map("i", "<A-[>", "[]<Left>")
map("i", "<A-]>", "]<Left>")
map("i", "<A-{>", "{}<Left>")
map("i", "<A-}>", "}<Left>")
map("i", "<A-;>", ";")
map("i", "<A-/>", "?")

-- Deletes
map("i", "<A-p>", "<Backspace>")
map("n", "dm", "dw")
map("n", "dn", "db")
map("i", "<A-w>", "<C-o>dw")
map("i", "<A-q>", "<C-o>db")

-- Normal Mode Utils
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ",", "o<C-c>")
map("n", ".", "<S-o><C-c>")
map("n", "<A-b>", "<S-v>yp")
map("n", "<A-r>", "<C-r>")
map("n", "<leader>u", "<cmd>q!<CR>")
map("n", "<leader>i", "<cmd>vsplit<CR>")
map("n", "<leader>o", "<cmd>split<CR>")

-- Scroll
-- map("n", "<A-e>", "<C-d>")
-- map("n", "e", "<C-d>")
-- map("n", "<A-w>", "<C-u>")
-- map("n", "w", "<C-u>")

-- Visual
map("n", "vv", "<S-v>")

---------------------- Plugins -----------------------------
local Plugins = {}

--Telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>")
map("n", "<leader>j", "<cmd>Telescope file_browser<CR>")
map("n", "<leader>fe", "<cmd>Telescope emoji<CR>")
map("n", "<leader>gc", "<cmd>Telescope gitmoji<CR>")

-- Hop
map({ "n", "v", "i" }, "<A-f>", "<cmd>HopWord<CR>")
map({ "n", "v", "i" }, "<A-a>", "<cmd>HopAnywhere<CR>")
map({ "n", "v" }, "<A-c>", "<cmd>HopLine<CR>")

-- Cinnamon
-- Half-window movements:
vim.keymap.set({ "n", "x" }, "<A-w>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<A-e>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
vim.keymap.set({ "n", "x" }, "w", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "e", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
-- vim.keymap.set({ "n", "x" }, "<PageUp>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>"),
-- vim.keymap.set({ "n", "x" }, "<PageDown>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>"),

-- EXTRA_KEYMAPS:

-- Start/end of file and line number movements:
-- vim.keymap.set({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>"),
-- vim.keymap.set({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 1)<CR>"),

-- Start/end of line:
vim.keymap.set({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
vim.keymap.set({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
vim.keymap.set({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
vim.keymap.set({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
vim.keymap.set({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
vim.keymap.set("n", "n", "<Cmd>lua Scroll('n', 1)<CR>")
vim.keymap.set("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
-- vim.keymap.set("n", "*", "<Cmd>lua Scroll('*', 1)<CR>"),
-- vim.keymap.set("n", "#", "<Cmd>lua Scroll('#', 1)<CR>"),
-- vim.keymap.set("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>"),
-- vim.keymap.set("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>"),

-- -- Previous/next cursor location:
-- vim.keymap.set("n", "<C-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>"),
-- vim.keymap.set("n", "<C-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>"),

-- Screen scrolling:
vim.keymap.set("n", "fj", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
vim.keymap.set("n", "fl", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
vim.keymap.set("n", "fk", "<Cmd>lua Scroll('zb', 0, 1)<CR>")
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

-- EXTENDED_KEYMAPS:

-- Up/down movements:
vim.keymap.set({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
vim.keymap.set({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:

vim.keymap.set({ "n", "x" }, "<ScrollWheelUp>", "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
vim.keymap.set({ "n", "x" }, "<ScrollWheelDown>", "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

Plugins.telescope = {
	i = {
		["<A-k>"] = require("telescope.actions").move_selection_next,
		["<A-l>"] = require("telescope.actions").move_selection_previous,
		["<A-j>"] = require("telescope.actions").select_default,

		["<A-w>"] = require("telescope.actions").file_vsplit,
		["<A-e>"] = require("telescope.actions").file_split,

		["<A-m>"] = require("telescope.actions").preview_scrolling_down,
		["<A-n>"] = require("telescope.actions").preview_scrolling_down,

		["<A-q>"] = require("telescope.actions").close,

		["<A-a>"] = require("telescope.actions").toggle_all,
	},

	n = {
		["j"] = require("telescope.actions").select_default,
		["<A-j>"] = require("telescope.actions").select_default,

		["k"] = require("telescope.actions").move_selection_next,
		["l"] = require("telescope.actions").move_selection_previous,
		["<A-k>"] = require("telescope.actions").move_selection_next,
		["<A-l>"] = require("telescope.actions").move_selection_previous,

		["<A-w>"] = require("telescope.actions").file_vsplit,
		["<A-e>"] = require("telescope.actions").file_split,

		["<A-n>"] = require("telescope.actions").preview_scrolling_up,
		["<A-m>"] = require("telescope.actions").preview_scrolling_down,

		["q"] = require("telescope.actions").close,
		["<A-q>"] = require("telescope.actions").close,
	},
}

Plugins.file_browser = {

	["i"] = {
		["<C-o>"] = fb_actions.open,
		["<C-e>"] = fb_actions.goto_home_dir,
		["<C-w>"] = fb_actions.goto_cwd,
		["<C-t>"] = fb_actions.change_cwd,
		["<C-h>"] = fb_actions.toggle_hidden,
		["<C-s>"] = fb_actions.toggle_all,
		["<bs>"] = fb_actions.backspace,

		["<A-h>"] = fb_actions.goto_cwd,
		["<A-s>"] = fb_actions.remove,
		["<A-f>"] = fb_actions.toggle_browser,
		["<A-c>"] = fb_actions.create,
		["<S-CR>"] = fb_actions.create_from_prompt,
		["<A-r>"] = fb_actions.rename,
		["<A-m>"] = fb_actions.move,
		["<A-y>"] = fb_actions.copy,
		["<A-g>"] = function(prompt_bufnr)
			local selections = fb_utils.get_selected_files(prompt_bufnr, false)
			local search_dirs = vim.tbl_map(function(path)
				return path:absolute()
			end, selections)
			if vim.tbl_isempty(search_dirs) then
				local current_finder = action_state.get_current_picker(prompt_bufnr).finder
				search_dirs = { current_finder.path }
			end
			fb_actions.close(prompt_bufnr)
			require("telescope.builtin").live_grep({ search_dirs = search_dirs })
		end,
	},
	["n"] = {
		["<A-d>"] = fb_actions.remove,
		["<A-c>"] = fb_actions.create,
		["<A-j>"] = fb_actions.open,

		["c"] = fb_actions.create,
		["a"] = fb_actions.create,
		["f"] = fb_actions.create,
		["r"] = fb_actions.rename,
		["m"] = fb_actions.move,
		["y"] = fb_actions.copy,
		["d"] = fb_actions.remove,
		["o"] = fb_actions.open,
		["g"] = fb_actions.goto_parent_dir,
		["e"] = fb_actions.goto_home_dir,
		["w"] = fb_actions.goto_cwd,
		["t"] = fb_actions.change_cwd,
		["b"] = fb_actions.toggle_browser,
		["h"] = fb_actions.toggle_hidden,
		["s"] = fb_actions.toggle_all,
	},
}
-------------------- EOF --------------------------
-- Tmux Navigation
vim.api.nvim_set_keymap(
	"n",
	"<A-k>",
	[[winnr('#') < 0 ? 'k' : ':TmuxNavigateUp<CR>']],
	{ expr = true, noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap(
--   "n",
--   "<A-i>",
--   [[winnr('#') < 0 ? 'i' : ':TmuxNavigateDown<CR>']],
--   { expr = true, noremap = true, silent = true }
-- )
vim.api.nvim_set_keymap(
	"n",
	"<A-l>",
	[[winnr('#') < 0 ? 'l' : ':TmuxNavigateRight<CR>']],
	{ expr = true, noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<A-h>",
	[[winnr('#') < 0 ? 'h' : ':TmuxNavigateLeft<CR>']],
	{ expr = true, noremap = true, silent = true }
)

return Plugins
