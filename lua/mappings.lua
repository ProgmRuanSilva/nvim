local utils = require("utils")

local map = vim.keymap.set

-- 🚧 Test Area 🚧
map({ "n", "v" }, "<C-q>", "<cmd> noh <cr>", { desc = "Clear highlight" })
map({ "n", "v", "i" }, "<C-q>", "<Esc>", { desc = "Exit from visual mode", noremap = true })
map("n", "vj", "viw", { desc = "Select word" })

-- Normal Mode
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

-- Navigation
map("i", "<C-k>", "<Up>", { desc = "Up" })
map("i", "<C-j>", "<Down>", { desc = "Down" })
map("i", "<C-h>", "<Left>", { desc = "Left" })
map("i", "<C-l>", "<Right>", { desc = "Right" })
map({ "n", "v" }, "<C-e>", "%", { desc = "Jump toggle pair", noremap = true, silent = true })
map("i", "<C-e>", "<C-o>%", { desc = "Jump to toggle pair" })

-- Insert Utils
map("i", "<C-r>", "<C-o>u", { desc = "Undo" })
map("i", "<C-o>", "<C-o>o", { desc = "New line" })
map("n", "<C-o>", "<S-o>", { desc = "New Line " })
map("i", "<C-b>", "<C-o><S-v>y<C-o>p", { desc = "Copy line to bottom" })
map("n", "<C-w>", "db", { noremap = true })
map({ "i", "v", "n" }, "<C-s>", "<C-Right>", { desc = "Next word", silent = true, noremap = true })
map({ "i", "v", "n" }, "<C-a>", "<C-Left>", { desc = "Previous word", silent = true, noremap = true })

--WARN: We remaped The control + backspace to be ctrol + w in kitty.conf
map("i", "<C-w>", "<C-o>db", { noremap = true })

-- map("i", "<A-;>", ":", { desc = "Colon" })
map("i", "<C-/>", "?", { desc = "Question", noremap = true })
map("i", "<C-->", "_", { desc = "Underscore", noremap = true })
map("i", "<C-=>", "=", { desc = "Equal", noremap = true })
map("i", "<C-4>", "$", { desc = "Dolar", noremap = true })
map("i", "<C-5>", "%", { desc = "Percent", noremap = true })
map("i", "<C-3>", "#", { desc = "Hash", noremap = true })
map("i", "<C-2>", "@", { desc = "At", noremap = true })
map("i", "<C-1>", "!", { desc = "Exclamation", noremap = true })
map("i", "<C-[>", "v:lua.MiniPairs.open('{}')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<C-]>", "v:lua.MiniPairs.close('{}')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<C-,>", "v:lua.MiniPairs.open('<>')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<C-.>", "v:lua.MiniPairs.close('<>')", { expr = true, noremap = true, replace_keycodes = false })
map("i", "<C-'>", "v:lua.MiniPairs.open('\"\"')", { expr = true, noremap = true, replace_keycodes = false })

-- Deletes
map({ "n", "v" }, "<C-q>j", "<cmd> noh <cr>", { desc = "Clear highlight" })
map("i", "<C-f>", "<C-o>$", { desc = "End of line" })
-- map("i", "<C-w>", "<C-o>dw", { desc = "Delete next word" })
map("n", "ds", "dw", { desc = "Delete next word" })
map("n", "da", "db", { desc = "Delete previews word" })
map("n", "dj", "diw", { desc = "Delete current word" })
map("n", "df", "d$", { desc = "Delete to end of line" })

-- Normal Mode Utils
map("n", ",", "o<C-c>", { desc = "Create new line" })
map("n", ".", "<S-o><C-c>", { desc = "Create new line" })
map("n", "<C-c>", "A", { desc = "Insert in the end of line" })
map("n", "<C-b>", "<S-v>yp", { desc = "Copy line below" })
map({ "n", "v" }, "ff", function()
	utils.move_cursor()
end, { desc = "Move cursor on the line" })

-- Marks
map("n", "fa", "m", { desc = "Add a new mark", silent = true })
map({ "n", "v" }, ";", function()
	require("which-key").show("'", { mode = "n", auto = true })
end, { desc = "show marks" })
map("n", ";;", "<C-o>", { desc = "Toggle between jumps", silent = true })
-- map("n", "<A-;>", "<C-i>", { desc = "Toggle between jumps", silent = true })

-- Folds
map("n", "fs", "za", { desc = "Toggle fold" })
map("n", "<C-j>", "za", { desc = "Toggle fold" })
map("n", "fo", "zA", { desc = "Toggle all folds" })
map("n", "fO", "<cmd>lua require('ufo').openAllFolds()<CR>", { desc = "Open all folds" })
map("n", "fc", "<cmd>lua require('ufo').closeAllFolds()<CR>", { desc = "Close all folds" })

-- Command
map("c", "<C-l>", "<Up>", { desc = "Up" })
map("c", "<C-k>", "<Down>", { desc = "Down" })
map("c", "<C-h>", "<Left>", { desc = "Left" })
map("c", "<C-f>", "<Right>", { desc = "Right" })
map("c", "<C-b>", "<Home>", { desc = "Start of line" })
map("c", "<C-c>", "<End>", { desc = "End of line" })
map("c", "<C-s>", "<Del>", { desc = "Delete" })
-- map("c", "<C-BS>", "<C-BS>", { desc = "Delete" })
map("c", "<C-j>", "<Enter>", { desc = "Enter" })
map("c", "<C-a>", "<C-b>", { desc = "Next word" })
map("c", "<C-f>", "<C-f>", { desc = "Previous word" })

-- Visual
map("n", "vv", "<S-v>", { desc = "Select all line" })

-- Configurations
map("n", "<leader>cm", "<cmd> Mason <CR>", { desc = "Mason" })
map("n", "<leader>cl", "<cmd> Lazy <CR>", { desc = "Lazy" })
map("n", "<leader>cf", "<cmd> ConformInfo <CR>", { desc = "Conform" })
map("n", "<leader>ci", "<cmd> LspInfo <CR>", { desc = "LSP Info" })
map("n", "<leader>cs", "<cmd> help lspconfig-all <CR>", { desc = "LSP Info" })

-- Saves
map("n", "<leader>s", "<cmd>up<CR>", { desc = "Save", silent = true })

-- Pastes
map({ "n", "v" }, "<C-v>", '"0p', { desc = "Paste the current clipboard" })
-- map({ "n", "v" }, "p", "p", { desc = "Paste the last deleted text" })

-- Quit's
map("n", "qq", "<cmd>q!<CR>", { desc = "Force quit" })
map("n", "qj", "<cmd>close<CR>", { desc = "Close a split" })
map("n", "qk", "<cmd>bd %<CR>", { desc = "Close buffer" })
map("n", "qx", "<cmd>tabclose %<cr>", { desc = "Close buffer" })
map("n", "<leader>u", "<cmd>q!<CR>", { desc = "Force quit" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Buffer
-- map("n", "<A-m>", "<cmd>bnext<CR>", { desc = "Next Tab" })
-- map("n", "<A-n>", "<cmd>bprev<CR>", { desc = "Next Tab" })

-- Tabs
-- map("n", "<C-a>", "<cmd>tabnext<cr>", { desc = "Next tab" })
-- map("n", "<leader>n", "<cmd>tabnew<cr>", { desc = "Create a new tab" })
map("n", "<leader>t", "<cmd>Telescope projects projects<cr>", { desc = "Close tab" })

-- Splits
map("n", "<leader>i", "<cmd>vsplit<CR>", { desc = "Split vertical" })

map("n", ">>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move Buffer Right" })

map("n", "<<", "<cmd>BufferLineMovePrev<CR>", { desc = "Move Buffer Left" })

-- Lsp
map(
	"n",
	"gpd",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	{ noremap = true, desc = "Goto Definition" }
)
map(
	"n",
	"gpD",
	"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
	{ noremap = true, desc = "Goto Type Definition" }
)
map(
	"n",
	"gpi",
	"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
	{ noremap = true, desc = "Goto Implementation" }
)
map(
	"n",
	"gpk",
	"<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
	{ noremap = true, desc = "Goto Declaration" }
)
map(
	"n",
	"gpg",
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

-- Cinnamon
map({ "n", "x" }, "<C-d>", function()
	require("cinnamon").scroll("<C-u>zz")
end, { desc = "Scroll up", noremap = true })

map({ "n", "x" }, "<C-f>", function()
	require("cinnamon").scroll("<C-d>zz")
end, { desc = "Scroll down", noremap = true })

-- Page movements:
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

-- Git
map("n", "gF", "<cmd>GitBlameToggle<CR>", { desc = "Git Blame" })

-- Lazygit
map("n", "<leader>gd", "<cmd> LazyGit <CR>", { desc = "Lazygit" })

-- GitSigns
map("n", "ghs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "ghr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("v", "ghs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "Stage hunk" })
end)
map("v", "ghr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "Reset hunk" })
end)
map("n", "ghS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage buffer" })
map("n", "ghu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
map("n", "ghR", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })
map("n", "ghp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "ghb", function()
	require("gitsigns").blame_line({ full = true }, { desc = "Blame line" })
end)
map("n", "gtb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle current line blame" })
map("n", "ghd", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this" })
map("n", "ghD", function()
	require("gitsigns").diffthis("~")
end, { desc = "Diff this ~" })
map("n", "td", function()
	require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })

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
	require("comment.api").toggle.linewise.current(vim.fn.visualmode())
end, { desc = "Comment selection" })

-- Trouble
map("n", "<leader>fq", "<cmd>TroubleToggle<CR>", { desc = "Trouble" })

-- UndoTree
map("n", "<A-U>", "<cmd> UndotreeToggle <CR>", { desc = "UndoTree" })

-- Dadbod
map("n", "<leader>q", "<cmd>DBUIToggle<CR>", { desc = "Dadbod" })

-- Spectre
map("n", "<leader>fs", "<cmd>lua require('spectre').open()<CR>", { desc = "Spectre" })

-- NvimTree
-- map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle NvimTree", noremap = true })

-- CodeCompanion
map("n", "<leader>aa", "<cmd> CodeCompanionChat Toggle <CR>", { desc = "Focus on CodeCompanionChat", noremap = true })
map({ "n", "v" }, "<leader>af", "<cmd>CodeCompanionActions<CR>", { desc = "CodeCompanion Actions", noremap = true }) -- This can't be used on the insertion mode because of the <leader> key delay

map("i", "<A-c>", "<cmd> CodeCompanionActions<CR>", { desc = "Focus on CodeCompanionChat", noremap = true })

map("n", "<leader>ad", "<cmd>CodeCompanionChat deepseek<CR>", { desc = "Chat with deepseek ", noremap = true })
map("n", "<leader>as", "<cmd>CodeCompanionChat openai<CR>", { desc = "Chat with ollama ", noremap = true })

-- Telescope
map("n", "<leader>j", "<cmd>Yazi<CR>", { desc = "File Explorer" })
map("n", "<leader><leader>", "<cmd>FzfLua files<CR>", { desc = "Find Files" })

map("n", "<leader>fd", "<cmd>FzfLua oldfiles<CR>", { desc = "Oldfiles" })

map("n", "<leader>k", "<cmd>FzfLua buffers<CR>", { desc = "Find Buffer" })
map("n", "<leader>ff", "<cmd>FzfLua live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>f]", "<cmd> TodoTelescope <CR>", { desc = "Todo" })
-- map("n", "<leader>fp", "<cmd> MarkdownPreviewToggle <CR>", { desc = "Markdown Preview" })

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
	"<C-k>",
	[[winnr('#') < 0 ? 'k' : ':TmuxNavigateUp<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate up" }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-l>",
	[[winnr('#') < 0 ? 'l' : ':TmuxNavigateRight<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate right" }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-h>",
	[[winnr('#') < 0 ? 'h' : ':TmuxNavigateLeft<CR>']],
	{ expr = true, noremap = true, silent = true, desc = "Navigate left" }
)

-- Change between buffers with numbers
for i = 1, 9, 1 do
	map("n", string.format("%s", i), function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end
