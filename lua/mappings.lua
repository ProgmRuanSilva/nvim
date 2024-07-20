require("nvchad.mappings")
local utils = require("utils")

local lint = require("lint")
local gitsigns = require("gitsigns")
local fb_actions = require("telescope._extensions.file_browser.actions")

local map = vim.keymap.set

-- Navigation
map("i", "<A-k>", "<Up>", { desc = "Up" })
map("i", "<A-j>", "<Down>", { desc = "Down" })
map("i", "<A-h>", "<Left>", { desc = "Left" })
map("i", "<A-l>", "<Right>", { desc = "Right" })
map("i", "<A-c>", "<C-o>$", { desc = "End of line", silent = true })
map("i", "<A-m>", "<C-o>w", { desc = "Next word", silent = true })
map("i", "<A-n>", "<C-o>b", { desc = "Previous word", silent = true })
map("n", "<A-v>", "<cmd> noh <cr>", { desc = "Clear highlight", silent = true })
map("i", "<A-a>", "<C-o>%", { desc = "Jump toggle pair", noremap = true, silent = true })
map({ "n", "v" }, "<A-a>", "%", { desc = "Move between pairs", noremap = true, silent = true })

-- Cinnamon
map({ "n", "x" }, "<A-w>", function()
	require("cinnamon").scroll("<C-u>")
end, { desc = "Scroll up", noremap = true })

map({ "n", "x" }, "<A-e>", function()
	require("cinnamon").scroll("<C-d>")
end, { desc = "Scroll down", noremap = true })

-- Page movements:
map({ "n", "x" }, "w", function()
	require("cinnamon").scroll("<C-b>zz")
end, { desc = "Scroll up", noremap = true })

map({ "n", "x" }, "e", function()
	require("cinnamon").scroll("<C-f>zz")
end, { desc = "Scroll down", noremap = true })

-- Screen scrolling:
map("n", "f", function()
	require("cinnamon").scroll("zz")
end, { desc = "Center cursor" })
map("n", "fw", function()
	require("cinnamon").scroll("zt")
end, { desc = "Move Cursor to Top" })
map("n", "fe", function()
	require("cinnamon").scroll("zb")
end, { desc = "Move Cursor to Bottom" })

-- Universal Utils
map({ "n", "v" }, "m", function()
	require("cinnamon").scroll("w")
end, { desc = "Move forward word", silent = true, noremap = true })
map({ "n", "v", "x", "o" }, "n", function()
	require("cinnamon").scroll("N")
end, { desc = "Move back word", silent = true, noremap = true, nowait = true, expr = true })
map({ "n", "v", "x", "o" }, "nn", function()
	require("cinnamon").scroll("b")
end, { desc = "Move back word", silent = true, noremap = true })

-- Insetion
map({ "i", "v" }, "<A-f>k", function()
	require("hop").hint_words()
end, { desc = "Hop Word" })

map({ "i", "v" }, "<A-f>j", function()
	require("hop").hint_lines()
end, { desc = "Hop Anywhere" })

map({ "i", "v" }, "<A-f>l", function()
	require("hop").hint_anywhere()
end, { desc = "Hop Line" })

map({ "i", "v" }, "<A-f>;", function()
	require("hop").hint_anywhere({ current_line_only = true })
end, { desc = "Hop Current Line" })

map({ "i", "v" }, "<A-f>n", function()
	require("hop").hint_vertical()
end, { desc = "Hop Vertical" })

map({ "n", "v" }, "fk", function()
	require("hop").hint_words()
end, { desc = "Hop Word" })

map({ "n", "v" }, "fj", function()
	require("hop").hint_lines()
end, { desc = "Hop Anywhere" })

map({ "n", "v" }, "fl", function()
	require("hop").hint_anywhere()
end, { desc = "Hop Anywhere" })

map({ "n", "v" }, "f;", function()
	require("hop").hint_anywhere({ current_line_only = true })
end, { desc = "Hop Line" })

map({ "n", "v" }, "fn", function()
	require("hop").hint_vertical()
end, { desc = "Hop Vertical" })

-- Insert Utils
map("i", "<A-v>", "<Esc>", { desc = "Escape from insert mode" })
map("i", "<A-o>", "<C-o>o", { desc = "New line" })
map("i", "<A-b>", "<C-o><S-v>y<C-o>p", { desc = "Copy line to bottom" })
map("n", "<A-o>", "<S-o>", { desc = "New Line " })
map("i", "<A-r>", "<C-o>u", { desc = "Undo" })
map("i", "<A-g>", "<C-o><C-r>", { desc = "Redo" })

map("i", "<A-;>", ":", { desc = "Colon" })
map("i", "<A-/>", "?", { desc = "Question" })
map("i", "<A-->", "_", { desc = "Underscore" })
map("i", "<A-=>", "=", { desc = "Equal" })
map("i", "<A-4>", "$", { desc = "Dolar" })
map("i", "<A-5>", "%", { desc = "Percent" })
map("i", "<A-3>", "#", { desc = "Hash" })
map("i", "<A-2>", "@", { desc = "At" })
map("i", "<A-1>", "!", { desc = "Exclamation" })
map("i", "<A-[>", "v:lua.MiniPairs.open('{}')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<A-]>", "v:lua.MiniPairs.close('{}')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<A-,>", "v:lua.MiniPairs.open('<>')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<A-.>", "v:lua.MiniPairs.close('<>')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<A-'>", "v:lua.MiniPairs.open('\"\"')", { expr = true, noremap = true, replace_keycodes = false })

-- Deletes
map({ "n", "v" }, "<A-q>", "<cmd> noh <cr>", { desc = "Clear highlight" })
map({ "n", "v" }, "<A-q>j", "<cmd> noh <cr>", { desc = "Clear highlight" })
map("i", "<A-f>d", "<C-o>d", { desc = "Delete mode" })
map("i", "<A-w>", "<C-o>dw", { desc = "Delete next word" })
map("i", "<A-q>", "<C-o>db", { desc = "Delete previous word" })
map("i", "<A-f>dm", "<C-o>dw", { desc = "Delete next word" })
map("i", "<A-f>dn", "<C-o>db", { desc = "Delete previous word" })
map("i", "<A-f>df", "<C-o>d$", { desc = "Delete to end of line" })
map("i", "<A-p>", "<Backspace>", { desc = "Backspace" })
map("n", "dm", "dw", { desc = "Delete word" })
map("n", "dn", "db", { desc = "Delete word" })
map("n", "df", "d$", { desc = "Delete to end of line" })

-- Normal Mode Utils
map("n", "<A-c>", "A", { desc = "Insert in the end of line" })
map("n", ",", "o<C-c>", { desc = "Create new line" })
map("n", ".", "<S-o><C-c>", { desc = "Create new line" })
map("n", "<A-b>", "<S-v>yp", { desc = "Copy line below" })
map("n", "<A-r>", "<C-r>", { desc = "Redo" })
map({ "n", "v" }, "ff", function()
	utils.move_cursor()
end, { desc = "Move cursor on the line" })

-- Marks
map("n", "fa", "m", { desc = "Add a new mark", silent = true })
map({ "n", "v" }, ";", function()
	require("which-key").show("'", { mode = "n", auto = true })
end, { desc = "show marks" })

-- Folds
map("n", "fs", "za", { desc = "Toggle fold" })
map("n", "fo", "zA", { desc = "Toggle all folds" })
map("n", "fO", "<cmd>lua require('ufo').openAllFolds()<CR>", { desc = "Open all folds" })
map("n", "fc", "<cmd>lua require('ufo').closeAllFolds()<CR>", { desc = "Close all folds" })

-- Command
map("c", "<A-l>", "<Up>", { desc = "Up" })
map("c", "<A-k>", "<Down>", { desc = "Down" })
map("c", "<A-h>", "<Left>", { desc = "Left" })
map("c", "<A-f>", "<Right>", { desc = "Right" })
map("c", "<A-b>", "<Home>", { desc = "Start of line" })
map("c", "<A-c>", "<End>", { desc = "End of line" })
map("c", "<A-s>", "<Del>", { desc = "Delete" })
map("c", "<A-p>", "<BS>", { desc = "Delete" })
map("c", "<A-j>", "<Enter>", { desc = "Enter" })
map("c", "<A-n>", "<C-b>", { desc = "Next word" })
map("c", "<A-m>", "<C-f>", { desc = "Previous word" })

-- Visual
map("n", "vv", "<S-v>", { desc = "Select all line" })
map("v", "<A-e>", "<C-q>", { desc = "Block mode", noremap = true })

-- Configurations
map("n", "<leader>cm", "<cmd> Mason <CR>", { desc = "Mason" })
map("n", "<leader>cl", "<cmd> Lazy <CR>", { desc = "Lazy" })
map("n", "<leader>cf", "<cmd> ConformInfo <CR>", { desc = "Conform" })
map("n", "<leader>ci", "<cmd> LspInfo <CR>", { desc = "LSP Info" })
map("n", "<leader>cs", "<cmd> help lspconfig-all <CR>", { desc = "LSP Info" })

-- Saves
map("n", "<leader>s", "<cmd>up<CR>", { desc = "Save", silent = true })
map("i", "<A-s>", "<cmd>up<CR>", { desc = "Save", silent = true })

-- Pastes
map({ "n", "v" }, "<A-p>", '"0p', { desc = "Paste the current clipboard" })
map({ "n", "v" }, "p", "p", { desc = "Paste the last deleted text" })

-- Quit's
map("n", "qq", "<cmd>q!<CR>", { desc = "Force quit" })
map("n", "qj", "<cmd>close<CR>", { desc = "Close a split" })
map("n", "qk", "<cmd>bd %<CR>", { desc = "Close buffer" })
map("n", "qx", "<cmd>tabclose %<cr>", { desc = "Close buffer" })
map("n", "<leader>u", "<cmd>q!<CR>", { desc = "Force quit" })

-- Buffer
map("n", "<A-m>", "<cmd>bnext<CR>", { desc = "Next Tab" })
map("n", "<A-n>", "<cmd>bprev<CR>", { desc = "Next Tab" })

-- Tabs
map("n", "<C-m>", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<C-n>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- Splits
map("n", "<leader>i", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>o", "<cmd>split<CR>", { desc = "Split horizontal" })

map("n", ">>", function()
	require("nvchad.tabufline").move_buf(1)
end, { desc = "Move Buffer Right" })

map("n", "<<", function()
	require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move Buffer Left" })

-- Lsp
map(
	"n",
	"gkd",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true, desc = "Goto Definition" }
)
map(
	"n",
	"gkD",
	"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
	{ noremap = true, desc = "Goto Type Definition" }
)
map(
	"n",
	"gki",
	"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
	{ noremap = true, desc = "Goto Implementation" }
)
map(
	"n",
	"gkk",
	"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
	{ noremap = true, desc = "Goto Declaration" }
)
map(
	"n",
	"gkg",
	"<cmd>lua require('goto-preview').close_all_win()<CR>",
	{ noremap = true, desc = "Close all preview windows" }
)
map(
	"n",
	"gr",
	"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
	{ noremap = true, desc = "Goto References" }
)
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, desc = "Lsp code actions" })

---------------------- Plugins -----------------------------

-- Git
map("n", "gF", "<cmd>GitBlameToggle<CR>", { desc = "Git Blame" })

-- Lazygit
map("n", "<leader>gd", "<cmd> LazyGit <CR>", { desc = "Lazygit" })

-- Neogit
map("n", "<leader>gg", "<cmd> Neogit <CR>", { desc = "Neogit" })
map("n", "<leader>gw", "<cmd> Neogit worktree <CR>", { desc = " Worktree " })
map("n", "<leader>dd", "<cmd> Neogit diff <CR>", { desc = " Neogit Diff" })
map("n", "<leader>gf", "<cmd> Neogit fetch <CR>", { desc = "Fetch" })
map("n", "<leader>gb", "<cmd> Neogit branch <CR>", { desc = "Branch" })
map("n", "<leader>gh", "<cmd> Neogit pull <CR>", { desc = "Pull" })
map("n", "<leader>gp", "<cmd> Neogit push <CR>", { desc = "Push" })
map("n", "<leader>gc", "<cmd> Neogit commit <CR>", { desc = "Commit" })
map("n", "<leader>gm", "<cmd> Neogit merge <CR>", { desc = "Merge" })

-- Octo
map("n", "<leader>gpl", "<cmd>Octo pr list<CR>", { desc = "List Pull Requests" })
map("n", "<leader>gpa", "<cmd>Octo pr create<CR>", { desc = "Open A New Pull Request" })
map("n", "<leader>gpe", "<cmd>Octo pr edit<CR>", { desc = "Edit Pull Request" })
map("n", "<leader>gpc", "<cmd>Octo pr changes<CR>", { desc = "Pull Request Diff" })
map("n", "<leader>gpd", "<cmd>Octo pr close<CR>", { desc = "Close Pull Request" })

map("n", "<leader>gpr", "<cmd>Octo pr review<CR>", { desc = "Mark Pull Request as review" })
map("n", "<leader>gpR", "<cmd>Octo pr reopen<CR>", { desc = "Reopen Pull Request" })

map("n", "<leader>gph", "<cmd>Octo pr checks<CR>", { desc = "View Pull Request Actions" })
map("n", "<leader>gpu", "<cmd>Octo pr url<CR>", { desc = "Copy Pull Request url" })
map("n", "<leader>gpbc", "<cmd>Octo pr checkout<CR>", { desc = "Checkout Pull Request Branch" })
map("n", "<leader>gpo", "<cmd>Octo pr browser<CR>", { desc = "Open Pull Request" })

map("n", "<leader>gil", "<cmd>Octo issue list<CR>", { desc = "List Issues Request" })
map("n", "<leader>gia", "<cmd>Octo issue create<CR>", { desc = "Create A New Issue Request" })
map("n", "<leader>gie", "<cmd>Octo issue edit<CR>", { desc = "Edit Issue Request" })
map("n", "<leader>gie", "<cmd>Octo issue edit<CR>", { desc = "Edit Issue Request" })

map("n", "<leader>grl", "<cmd>Octo repo list<CR>", { desc = "List Repositories" })

-- GitSigns
map("n", "ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
map("n", "ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
map("v", "ghs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "Stage hunk" })
end)
map("v", "ghr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "Reset hunk" })
end)
map("n", "ghS", gitsigns.stage_buffer, { desc = "Stage buffer" })
map("n", "ghu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
map("n", "ghR", gitsigns.reset_buffer, { desc = "Reset buffer" })
map("n", "ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
map("n", "ghb", function()
	gitsigns.blame_line({ full = true }, { desc = "Blame line" })
end)
map("n", "gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
map("n", "ghd", gitsigns.diffthis, { desc = "Diff this" })
map("n", "ghD", function()
	gitsigns.diffthis("~")
end, { desc = "Diff this ~" })
map("n", "td", gitsigns.toggle_deleted, { desc = "Toggle deleted" })

-- Codeium
map("i", "<A-i>", function()
	return vim.fn["codeium#Accept"]()
end, { noremap = true, expr = true, silent = true, desc = "Accept codeium suggestion" })
map("i", "<A-z>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { noremap = true, expr = true, silent = true, desc = "Cycle codeium suggestion" })
map("i", "<A-t>", function()
	return vim.fn["codeium#Clear"]()
end, { noremap = true, expr = true, silent = true, desc = "Clear codeium suggestion" })

-- Package Info
map("n", "<leader>ps", function()
	return require("package-info").show()
end, { noremap = true, desc = "Show package info" })

map("n", "<leader>pc", function()
	return require("package-info").hide()
end, { noremap = true, desc = "Hide package info" })

map("n", "<leader>pt", function()
	return require("package-info").toggle()
end, { noremap = true, desc = "Toggle package info" })

map("n", "<leader>pu", function()
	return require("package-info").update()
end, { noremap = true, desc = "Update package info" })

map("n", "<leader>pd", function()
	return require("package-info").delete()
end, { noremap = true, desc = "Delete package info" })

map("n", "<leader>pi", function()
	return require("package-info").install()
end, { noremap = true, desc = "Install package info" })

map("n", "<leader>pv", function()
	return require("package-info").change_version()
end, { noremap = true, desc = "Change version package info" })

-- Comment
map({ "v", "x" }, "/", function()
	require("Comment.api").toggle.linewise.current(vim.fn.visualmode())
end, { desc = "Comment selection" })

map("n", "<leader>gll", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- Lazydocker
map("n", "<leader>dl", "<cmd>LazyDocker<CR>", { desc = "LazyDocker" })

-- Trouble
map("n", "<leader>fq", "<cmd>TroubleToggle<CR>", { desc = "Trouble" })

-- UndoTree
map("n", "<A-U>", "<cmd> UndotreeToggle <CR>", { desc = "UndoTree" })

-- Dadbod
map("n", "<leader>q", "<cmd>DBUIToggle<CR>", { desc = "Dadbod" })

-- Spectre
map("n", "<leader>fs", "<cmd>lua require('spectre').open()<CR>", { desc = "Spectre" })

-- NvimTree
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle NvimTree", noremap = true })

-- Telescope
map("n", "<leader>j", "<cmd>Telescope file_browser<CR>", { desc = "File Browser" })
map("n", "<leader><leader>", "<cmd>Telescope file_browser<CR>", { desc = "File Brower" })

map("n", "<leader>fd", "<cmd>Telescope oldfiles<CR>", { desc = "Oldfiles" })

map("n", "<leader>k", "<cmd>Telescope find_buffer<CR>", { desc = "Find Buffer" })
map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

map("n", "<leader>fe", "<cmd> Telescope emoji <CR>", { desc = "Telescope Emoji" })
map("i", "<A-f>e", "<cmd> Telescope emoji <CR>", { desc = "Telescope Emoji" })
map("n", "<leader>[", "<cmd> Telescope notify <CR>", { desc = "Telescope Notify" })
map("n", "<leader>f]", "<cmd> TodoTelescope <CR>", { desc = "Todo" })
map("n", "<leader>fp", "<cmd> MarkdownPreviewToggle <CR>", { desc = "Markdown Preview" })

local Plugins = {}
Plugins.telescope = {
	i = {
		["<A-k>"] = require("telescope.actions").move_selection_next,
		["<A-l>"] = require("telescope.actions").move_selection_previous,
		["<A-j>"] = require("telescope.actions").select_default,

		["<A-i>"] = require("telescope.actions").file_vsplit,
		["<A-o>"] = require("telescope.actions").file_split,

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

		["<A-i>"] = require("telescope.actions").file_vsplit,
		["<A-o>"] = require("telescope.actions").file_split,

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

-- Vim Visual Multi
-- vim.cmd([[
--   let g:VM_maps = {}
--
--   let g:VM_maps['Find Under']                  = '<M-t>'
--   let g:VM_maps['Find Subword Under']          = '<M-t>'
--   let g:VM_maps["Select All"]                  = '\\A'
--   let g:VM_maps["Start Regex Search"]          = '\\/'
--   let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
--   let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
--   let g:VM_maps["Add Cursor At Pos"]           = '\\\'
--
--   let g:VM_maps["Visual Regex"]                = '\\/'
--   let g:VM_maps["Visual All"]                  = '\\A'
--   let g:VM_maps["Visual Add"]                  = '\\a'
--   let g:VM_maps["Visual Find"]                 = '\\f'
--   let g:VM_maps["Visual Cursors"]              = '\\c'
--
--
--   let g:VM_maps["Select Cursor Down"]          = '<M-C-Down>'
--   let g:VM_maps["Select Cursor Up"]            = '<M-C-Up>'
--
--   let g:VM_maps["Erase Regions"]               = '\\gr'
--
--   let g:VM_maps["Mouse Cursor"]                = '<C-LeftMouse>'
--   let g:VM_maps["Mouse Word"]                  = '<C-RightMouse>'
--   let g:VM_maps["Mouse Column"]                = '<M-C-RightMouse>'
--
--   let g:VM_maps["Switch Mode"]                 = '<Tab>'
--
--   let g:VM_maps["Find Next"]                   = ']'
--   let g:VM_maps["Find Prev"]                   = '['
--   let g:VM_maps["Goto Next"]                   = '}'
--   let g:VM_maps["Goto Prev"]                   = '{'
--   " let g:VM_maps["Seek Next"]                   = '<C-f>'
--   " let g:VM_maps["Seek Prev"]                   = '<C-b>'
--   let g:VM_maps["Skip Region"]                 = 'q'
--   let g:VM_maps["Remove Region"]               = 'Q'
--   let g:VM_maps["Invert Direction"]            = 'o'
--   let g:VM_maps["Find Operator"]               = "m"
--   let g:VM_maps["Surround"]                    = 'S'
--   let g:VM_maps["Replace Pattern"]             = 'R'
--
--   let g:VM_maps["Tools Menu"]                  = '\\`'
--   let g:VM_maps["Show Registers"]              = '\\"'
--   let g:VM_maps["Case Setting"]                = '\\c'
--   let g:VM_maps["Toggle Whole Word"]           = '\\w'
--   let g:VM_maps["Transpose"]                   = '\\t'
--   let g:VM_maps["Align"]                       = '\\a'
--   let g:VM_maps["Duplicate"]                   = '\\d'
--   let g:VM_maps["Rewrite Last Search"]         = '\\r'
--   let g:VM_maps["Merge Regions"]               = '\\m'
--   let g:VM_maps["Split Regions"]               = '\\s'
--   let g:VM_maps["Remove Last Region"]          = '\\q'
--   let g:VM_maps["Visual Subtract"]             = '\\s'
--   let g:VM_maps["Case Conversion Menu"]        = '\\C'
--   let g:VM_maps["Search Menu"]                 = '\\S'
--
--   let g:VM_maps["Run Normal"]                  = '\\z'
--   let g:VM_maps["Run Last Normal"]             = '\\Z'
--   let g:VM_maps["Run Visual"]                  = '\\v'
--   let g:VM_maps["Run Last Visual"]             = '\\V'
--   let g:VM_maps["Run Ex"]                      = '\\x'
--   let g:VM_maps["Run Last Ex"]                 = '\\X'
--   let g:VM_maps["Run Macro"]                   = '\\@'
--   let g:VM_maps["Align Char"]                  = '\\<'
--   let g:VM_maps["Align Regex"]                 = '\\>'
--   let g:VM_maps["Numbers"]                     = '\\n'
--   let g:VM_maps["Numbers Append"]              = '\\N'
--   let g:VM_maps["Zero Numbers"]                = '\\0n'
--   let g:VM_maps["Zero Numbers Append"]         = '\\0N'
--   let g:VM_maps["Shrink"]                      = "\\-"
--   let g:VM_maps["Enlarge"]                     = "\\+"
--
--   let g:VM_maps["Toggle Block"]                = '\\<BS>'
--   let g:VM_maps["Toggle Single Region"]        = '\\<CR>'
--   let g:VM_maps["Toggle Multiline"]            = '\\M'
--
--   " let g:VM_leader = '<A-t>'
--   " let g:VM_maps['Motion ,'] = ',,'
--
-- ]])

-- Tmux Navigation
vim.api.nvim_set_keymap(
	"n",
	"<A-k>",
	[[winnr('#') < 0 ? 'k' : ':TmuxNavigateUp<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate up" }
)
vim.api.nvim_set_keymap(
	"n",
	"<A-j>",
	[[winnr('#') < 0 ? 'j' : ':TmuxNavigateDown<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate down" }
)
vim.api.nvim_set_keymap(
	"n",
	"<A-l>",
	[[winnr('#') < 0 ? 'l' : ':TmuxNavigateRight<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate right" }
)
vim.api.nvim_set_keymap(
	"n",
	"<A-h>",
	[[winnr('#') < 0 ? 'h' : ':TmuxNavigateLeft<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate left" }
)

-- Change between buffers with numbers
for i = 1, 9, 1 do
	map("n", string.format("%s", i), function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end

return Plugins
