local conf = require("nvchad.configs.nvimtree")

conf.filters = {
	dotfiles = false,
	exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
}
conf.disable_netrw = true
conf.hijack_netrw = true
conf.hijack_cursor = true
conf.hijack_unnamed_buffer_when_opening = false
conf.sync_root_with_cwd = true
conf.update_focused_file = {
	enable = true,
	update_root = true,
}
conf.view = {
	adaptive_size = false,
	side = "left",
	float = {
		enable = true,
		open_win_config = function()
			local screen_w = vim.opt.columns:get()
			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
			local window_w = screen_w * 0.5
			local window_h = screen_h * 0.8
			local window_w_int = math.floor(window_w)
			local window_h_int = math.floor(window_h)
			local center_x = (screen_w - window_w) / 2
			local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
			return {
				border = "rounded",
				relative = "editor",
				row = center_y,
				col = center_x,
				width = window_w_int,
				height = window_h_int,
			}
		end,
	},
}
conf.git = {
	enable = true,
	ignore = false,
}
conf.filesystem_watchers = {
	enable = true,
}
conf.actions = {
	open_file = {
		resize_window = true,
	},
}
conf.renderer = {
	root_folder_label = true,
	highlight_git = true,
	highlight_opened_files = "none",

	indent_markers = {
		enable = false,
	},

	icons = {
		show = {
			file = true,
			folder = true,
			folder_arrow = true,
			git = true,
		},

		glyphs = {
			default = "󰈚",
			symlink = "",
			folder = {
				default = "",
				empty = "",
				empty_open = "",
				open = "",
				symlink = "",
				symlink_open = "",
				arrow_open = "",
				arrow_closed = "",
			},
			git = {
				unstaged = "✗",
				staged = "✓",
				unmerged = "",
				renamed = "➜",
				untracked = "★",
				deleted = "",
				ignored = "◌",
			},
		},
	},
}

return conf
