local conf = require("nvchad.configs.telescope")
package.path = "lua/?.lua;" .. package.path
local mappings = require("mappings")

conf.defaults = {
	vimgrep_arguments = {
		"rg",
		"-L",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
	},
	prompt_prefix = "   ",
	selection_caret = "  ",
	entry_prefix = "  ",
	initial_mode = "insert",
	selection_strategy = "reset",
	sorting_strategy = "ascending",
	layout_strategy = "horizontal",
	layout_config = {
		horizontal = {
			prompt_position = "top",
			preview_width = 0.50,
			results_width = 0.10,
		},
		vertical = {
			mirror = false,
		},
		width = 0.87,
		height = 0.80,
		preview_cutoff = 120,
	},
	file_sorter = require("telescope.sorters").get_fuzzy_file,
	file_ignore_patterns = { "node_modules" },
	generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
	path_display = { "truncate" },
	winblend = 0,
	border = {},
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	color_devicons = true,
	set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	mappings = mappings.telescope,
}
conf.extensions_list = { "themes", "file_browser", "emoji" }

conf.extensions = {

	file_browser = {
		path = vim.loop.cwd(),
		cwd = vim.loop.cwd(),
		cwd_to_path = false,
		grouped = true,
		files = true,
		add_dirs = true,
		depth = false,
		auto_depth = true,
		select_buffer = true,
		hidden = { file_browser = false, folder_browser = false },
		respect_gitignore = vim.fn.executable("fd") == 1,
		follow_symlinks = true,
		browse_files = require("telescope._extensions.file_browser.finders").browse_files,
		browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
		hide_parent_dir = false,
		collapse_dirs = false,
		prompt_path = false,
		quiet = false,
		dir_icon = "",
		dir_icon_hl = "Default",
		display_stat = { date = false, size = false, mode = false },
		hijack_netrw = true,
		use_fd = true,
		git_status = false,
		mappings = mappings.file_browser,
	},

	emoji = {
		action = function(emoji)
			-- argument emoji is a table.
			-- {name="", value="", cagegory="", description=""}

			vim.fn.setreg("*", emoji.value)
			print([[Press p or "*p to paste this emoji]] .. emoji.value)

			-- insert emoji when picked
			vim.api.nvim_put({ emoji.value }, "c", false, true)
		end,
	},

	fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
}
