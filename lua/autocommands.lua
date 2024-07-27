local lint = require("lint")
local autocmd = vim.api.nvim_create_autocmd
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- function ResizeWindows()
-- 	local savetab = vim.api.nvim_tabpage_get_id(vim.api.nvim_win_get_tabpage(vim.fn.bufwinid(0)))
-- 	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
-- 		if vim.api.nvim_buf_get_name(buf) ~= "" then
-- 			vim.cmd("buffer " .. buf .. " | wincmd =")
-- 		end
-- 	end
-- 	local next_tab = savetab + 1
-- 	while not vim.api.nvim_buf_exists(next_tab) do
-- 		next_tab = next_tab + 1
-- 	end
-- 	vim.cmd("tabnext " .. savetab)
-- end

-- I don't know what this isn't working might because the  width resize plugin, we need to check it later
function ResizeWindows()
	local tmux_screen_width = vim.fn.exec("tmux display-message -p '#S'")
	local savetab = vim.api.nvim_tabpage_get_id(vim.api.nvim_win_get_tabpage(vim.fn.bufwinid(0)))
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_name(buf) ~= "" then
			vim.cmd("buffer " .. buf .. " | wincmd =")
		end
	end
	local next_tab = savetab + 1
	while not vim.api.nvim_buf_exists(next_tab) do
		next_tab = next_tab + 1
	end
	-- Calculate the remaining width to fit on screen
	local neovim_window_width = vim.api.nvim_win_get_width(0)
	local tmux_screen_height = vim.fn.exec("tmux display-message -p '#H'")
	local new_width = math.floor(tmux_screen_width / tmux_screen_height * neovim_window_width)
	-- Resize the windows
	for _, win in ipairs(vim.api.nvim_tabnew().windows) do
		if #win.buffer.name > 0 then
			vim.api.nvim_win_set_width(win.handle, new_width)
		end
	end
end

autocmd({ "VimResized" }, {
	callback = ResizeWindows,
})

autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.cmd("MarkdownPreviewToggle")
	end,
})

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
