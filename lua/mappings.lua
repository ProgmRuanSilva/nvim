require("nvchad.mappings")

local fb_actions = require("telescope._extensions.file_browser.actions")
local fb_utils = require("telescope._extensions.file_browser.utils")
local action_state = require("telescope.actions.state")
local map = vim.keymap.set

-- Universal Utils
map({ "n", "i", "v" }, "<C-s>", "<cmd> w! <cr>")
map("n", "<A-q>", "<cmd> noh <CR>")
map({ "i", "v" }, "<A-q>", "<Esc>")
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
map("n", "<A-o>", "<S-o>")
map("i", "<A-r>", "<C-o>u")
map("i", "<A-g>", "<C-o><C-r>")

-- Insertion Chars
map("i", "<A-9>", "()<Left>")
map("i", "<A-0>", ")<Left>")
map("i", "<A-[>", "{}<Left>")
map("i", "<A-]>", "}<Left>")
map("i", "<A-;>", ":")
map("i", "<A-/>", "?")
map("i", "<A-'>", "'")
map("i", '<A-">', '"')

-- Deletes
map("i", "<A-x>", "<C-o>d")
map("i", "<A-p>", "<Backspace>")
map("n", "dm", "dw")
map("n", "dn", "db")
map("n", "df", "d$")
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

-- Command
map("c", "<A-l>", "<Up>")
map("c", "<A-k>", "<Down>")
map("c", "<A-f>", "<Left>")
map("c", "<A-h>", "<Right>")
map("c", "<A-b>", "<Home>")
map("c", "<A-c>", "<End>")
map("c", "<A-s>", "<Del>")
map("c", "<A-p>", "<BS>")
map("c", "<A-j>", "<Enter>")

-- Visual
map("n", "vv", "<S-v>")
map("n", "<A-q>", "<C-q>")
map("v", "<A-e>", "<C-q>")
map("v", "c", "<cmd>HopLine<CR>")
map("v", "a", "<cmd>HopAnywhere<CR>")

-- Tabs
map("n", "<A-m>", "<cmd>bnext<CR>", { desc = "Next Tab" })
map("n", "<A-n>", "<cmd>bprev<CR>", { desc = "Next Tab" })

-- Configurations
map("n", "<leader>cm", "<cmd> Mason <CR>", { desc = "Mason" })
map("n", "<leader>cl", "<cmd> Lazy <CR>")
map("n", "<leader>cf", "<cmd> ConformInfo <CR>")
map("n", "<leader>ci", "<cmd> LspInfo <CR>")
map("n", "<leader>cs", "<cmd> help lspconfig-all <CR>")

-- Lsp
map("n", "gkd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
map("n", "gkD", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
map("n", "gki", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
map("n", "gkl", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })
map("n", "gkg", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
map("n", "gkr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })

---------------------- Plugins -----------------------------
local Plugins = {}

-- Lazygit
map("n", "<leader>gd", "<cmd>LazyGit<CR>")

-- Git
map("n", "<leader>gf", "<cmd>GitBlameToggle<CR>")

-- Lazydocker
map("n", "<leader>dl", "<cmd>LazyDocker<CR>")

-- Trouble
map("n", "<leader>fq", "<cmd>TroubleToggle<CR>")

-- Gen
map("n", "<leader>ll", "<cmd>Gen Chat<CR>")
map("v", "<leader>ll", "<cmd>'<,'>Gen Chat<CR>")

-- Dadbod
map("n", "<leader>q", "<cmd>DBUIToggle<CR>")

-- Ufo
map("n", "fs", "za")
map("n", "fo", "<cmd>lua require('ufo').openAllFolds()<CR>")
map("n", "fc", "<cmd>lua require('ufo').closeAllFolds()<CR>")

-- Hop
map({ "n", "v", "i" }, "<A-f>", "<cmd>HopWord<CR>")
map({ "n", "v", "i" }, "<A-a>", "<cmd>HopAnywhere<CR>")
map({ "n", "v" }, "<A-c>", "<cmd>HopLine<CR>")
map({ "n", "v" }, "s", "<cmd>HopWord<CR>")
map({ "n", "v" }, "q", "<cmd>HopAnywhere<CR>")

--Telescope
map("n", "<leader><leader>", "<cmd>Telescope file_browser<CR>")
map("n", "<leader>j", "<cmd>Telescope file_browser<CR>")

map("n", "<leader>fk", "<cmd>Telescope find_buffer<CR>")
map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>")

map("i", "<A-g>", "<cmd>Telescope emoji <CR>")
map("n", "<leader>fe", "<cmd> Telescope emoji <CR>")
map("n", "<leader>gc", "<cmd> Telescope gitmoji <CR>")
map("n", "<leader>[", "<cmd> Telescope notify <CR>")
map("n", "<leader>f]", "<cmd> TodoTelescope <CR>")
map("n", "<leader>fp", "<cmd> MarkdownPreviewToggle <CR>")

-- ChatGPT
map("n", "<leader>cc", "<cmd>ChatGPT<CR>")

-- NvimTree
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle NvimTree" })

-- Codeium
map("i", "<A-i>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })
map("i", "<A-z>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
map("i", "<A-t>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })

-- Package Info
map("n", "<leader>ps", function()
	return require("package-info").show()
end, { noremap = true })

map("n", "<leader>pc", function()
	return require("package-info").hide()
end, { noremap = true })

map("n", "<leader>pt", function()
	return require("package-info").toggle()
end, { noremap = true })

map("n", "<leader>pu", function()
	return require("package-info").update()
end, { noremap = true })

map("n", "<leader>pd", function()
	return require("package-info").delete()
end, { noremap = true })

map("n", "<leader>pi", function()
	return require("package-info").install()
end, { noremap = true })

map("n", "<leader>pv", function()
	return require("package-info").change_version()
end, { noremap = true })

-- Comment
map("v", "/", function()
	require("Comment.api").toggle.linewise.current(vim.fn.visualmode())
end, { desc = "Comment selection" })

-- Tabufline
map("n", "<S-m>", function()
	require("nvchad.tabufline").move_buf(1)
end, { desc = "" })

map("n", "<S-b>", function()
	require("nvchad.tabufline").move_buf(-1)
end, { desc = "" })

-- Octo
map("n", "<leader>gpl", "<cmd>Octo pr list<CR>", { desc = "List Pull Requests" })
map("n", "<leader>gpa", "<cmd>Octo pr create<CR>", { desc = "Open A New Pull Request" })
map("n", "<leader>gpe", "<cmd>Octo pr edit<CR>", { desc = "Edit Pull Request" })
map("n", "<leader>gpc", "<cmd>Octo pr changes<CR>", { desc = "Pull Request Diff" })
map("n", "<leader>gpd", "<cmd>Octo pr close<CR>", { desc = "Close Pull Request" })

map("n", "<leader>gil", "<cmd>Octo issue list<CR>", { desc = "List Issues Request" })
map("n", "<leader>gia", "<cmd>Octo issue create<CR>", { desc = "Create A New Issue Request" })
map("n", "<leader>gie", "<cmd>Octo issue edit<CR>", { desc = "Edit Issue Request" })

map("n", "<leader>grl", "<cmd>Octo repo list<CR>", { desc = "List Repositories" })

-- Cinnamon
-- Half-window movements:
map({ "n", "x" }, "<A-w>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
map({ "n", "x" }, "<A-e>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
map({ "n", "x" }, "w", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
map({ "n", "x" }, "e", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

-- Start/end of file and line number movements:
map({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>")
map({ "n", "x" }, "]]", "<Cmd>lua Scroll('G', 0, 1)<CR>")

-- Screen scrolling:
map("n", "fj", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
map("n", "fl", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
map("n", "fk", "<Cmd>lua Scroll('zb', 0, 1)<CR>")

-- Up/down movements:
map({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
map({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
map({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
map({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
map({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
map({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
map({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
map({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:
map({ "n", "x" }, "<ScrollWheelUp>", "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
map({ "n", "x" }, "<ScrollWheelDown>", "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

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

-- Change between tabs with numbers
for i = 1, 9, 1 do
	map("n", string.format("%s", i), function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end

-- vim.api.nvim_set_keymap("n", "<A-j>", "<cmd>Gen Chat<CR>", { buffer = "gen.nvim", noremap = true, silent = true })
return Plugins
