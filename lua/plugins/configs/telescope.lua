local action = require "telescope.actions"

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
        ["<A-k>"] = action.move_selection_next,
        ["<A-l>"] = action.move_selection_previous,
        ["<A-j>"] = action.select_default,

        ["<A-w>"] = action.file_vsplit,
        ["<A-e>"] = action.file_split,

        ["<A-m>"] = action.preview_scrolling_down,
        ["<A-n>"] = action.preview_scrolling_down,

        ["<A-q>"] = action.close,

        ["<A-a>"] = action.toggle_all,
      },

      n = {
        ["j"] = action.select_default,
        ["<A-j>"] = action.select_default,

        ["k"] = action.move_selection_next,
        ["l"] = action.move_selection_previous,
        ["<A-k>"] = action.move_selection_next,
        ["<A-l>"] = action.move_selection_previous,

        ["<A-w>"] = action.file_vsplit,
        ["<A-e>"] = action.file_split,

        ["<A-n>"] = action.preview_scrolling_up,
        ["<A-m>"] = action.preview_scrolling_down,

        ["q"] = action.close,
        ["<A-q>"] = action.close,
      },
    },
  },
  extensions_list = { "themes", "gitmoji", "git_worktree", "emoji", "file_browser" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
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
  },
}

return options
