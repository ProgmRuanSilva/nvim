return {
	"rmagatti/goto-preview",
	event = "VimEnter",
	config = function()
		local gtp = require("goto-preview")
		local select_to_edit_map = {
			default = "edit",
			horizontal = "new",
			vertical = "vnew",
			tab = "tabedit",
		}

		local function open_file(orig_window, filename, cursor_position, command)
			if orig_window ~= 0 and orig_window ~= nil then
				vim.api.nvim_set_current_win(orig_window)
			end
			pcall(vim.cmd, string.format("%s %s", command, filename))
			vim.api.nvim_win_set_cursor(0, cursor_position)
		end

		local function open_preview(preview_win, type)
			return function()
				local command = select_to_edit_map[type]
				local orig_window = vim.api.nvim_win_get_config(preview_win).win
				local cursor_position = vim.api.nvim_win_get_cursor(preview_win)
				local filename = vim.api.nvim_buf_get_name(0)

				vim.api.nvim_win_close(preview_win, gtp.conf.force_close)
				open_file(orig_window, filename, cursor_position, command)

				local buffer = vim.api.nvim_get_current_buf()
				vim.api.nvim_buf_del_keymap(buffer, "n", "<A-i>")
				vim.api.nvim_buf_del_keymap(buffer, "n", "<CR>")
				vim.api.nvim_buf_del_keymap(buffer, "n", "<A-o>")
				vim.api.nvim_buf_del_keymap(buffer, "n", "<A-t>")
			end
		end

		local function post_open_hook(buf, win)
			vim.keymap.set("n", "<A-i>", open_preview(win, "vertical"), { buffer = buf })
			vim.keymap.set("n", "<CR>", open_preview(win, "default"), { buffer = buf })
			vim.keymap.set("n", "<A-o>", open_preview(win, "horizontal"), { buffer = buf })
			vim.keymap.set("n", "<A-t>", open_preview(win, "tab"), { buffer = buf })
		end

		require("goto-preview").setup({
			width = 120, -- Width of the floating window
			height = 25, -- Height of the floating window
			border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters of the floating window
			default_mappings = true, -- Bind default mappings
			debug = false, -- Print debug information
			opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
			resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
			post_open_hook = post_open_hook, -- A function taking two arguments, a buffer and a window to be ran as a hook.
			post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
			references = {
				telescope = require("telescope"),
			},
			-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
			focus_on_open = true, -- Focus the floating window when opening it.
			dismiss_on_move = true, -- Dismiss the floating window when moving the cursor.
			force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
			bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
			stack_floating_preview_windows = true, -- Whether to nest floating windows
			preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
		})
	end,
}
