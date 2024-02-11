local options = {
  defaults = {
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
    mappings = {
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

        ["<A-w>"] = require("telescope.actions").file_vsplit,
        ["<A-e>"] = require("telescope.actions").file_split,

        ["<A-n>"] = require("telescope.actions").preview_scrolling_up,
        ["<A-m>"] = require("telescope.actions").preview_scrolling_down,

        ["q"] = require("telescope.actions").close,
        ["<A-q>"] = require("telescope.actions").close,
      },
    },
  },
  extensions_list = { "themes", "terms", "gitmoji", "git_worktree", "emoji" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

return options
