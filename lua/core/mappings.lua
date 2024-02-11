-- n, v, i, t = mode names
local M = {}

M.general = {
  i = {
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },

    ["<A-h>"] = { "<Left>", "Move left" },
    ["<A-l>"] = { "<Right>", "Move right" },

    ["<A-j>"] = { "<Down>", "Move down" },
    ["<A-k>"] = { "<Up>", "Move up" },

    ["<A-g>"] = { "<C-o><End>", "End of line" },

    ["<A-n>"] = { "<C-o>b", "Back word phrase" },
    ["<A-m>"] = { "<C-o>w", "Next word phrase" },

    ["<A-w>"] = { "<C-o>dw", "Delete next word" },
    ["<A-q>"] = { "<C-o>db<Backspace>", "Delete previews word" },
    ["<A-p>"] = { "<Backspace>", "Backward Delete char" },

    ["<A-f>"] = { "<cmd>HopWord<CR>", "HopWord command to go to selected word" },
    ["<A-a>"] = { "<cmd>HopAnywhere<CR>", "HopWord command to go to selected word" },

    ["<A-o>"] = { "<C-o>o", "Create empty line on bottom" },
    ["<A-b>"] = { "<C-o><S-v>y<C-o>p", "Copy line to below" },

    ["<A-s>"] = { "<cmd>w!<CR>", "save" },
    ["<A-r>"] = { "<C-o><C-r>", "undo restore" },

    ["<A-u>"] = { "<C-o>p", "Paste clipboard" },

    ["<A-v>"] = { "<ESC>", "Escape insert mode" },

    ["<A-9>"] = { "()<Left>", "Add comma on insertion mode" },
    ["<A-0>"] = { ")", "Add comma on insertion mode" },
    ["<A-'>"] = { "'", "Add comma on insertion mode" },

  },

  n = {
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },

    ["n"] = { "b", "back one word for lazy people" },
    ["m"] = { "w", "next one word for lazy people" },

    ["dm"] = { "dw" },
    ["dn"] = { "db" },
    ["df"] = { "d$" },

    ["<A-s>"] = { "<cmd>w!<CR>" },
    ["<A-r>"] = { "<C-r>", "undo restore" },

    [";"] = { ":", "enter command mode" },
    ["<A-q>"] = { "<Esc>", "esc key" },
    ["<leader>u"] = { "<cmd>q<CR>", "Quit window" },

    ["f"] = { "<END>", "navigate to end of line" },
    ["ff"] = { "<HOME>", "navigate to beggining of line" },

    ["<A-m>"] = { "n", "next one word for lazy people" },
    ["<A-n>"] = { "<S-n>", "next one word for lazy people" },

    ["<S-n>"] = { "<S-v>xp", "move line to down" },
    ["<S-m>"] = { "<S-v>xk<S-p>", "move line to up" },

    [","] = { "o<C-c>", "add a new line in normal mode" },
    ["."] = { "<S-o><C-c>", "add a new line below in normal mode" },

    ["<A-o>"] = { "<S-o>", "insert on line below" },
    ["<A-b>"] = { "<S-v>yp", "copy line below" },

    ["<leader>i"] = { "<cmd>vsplit<CR>", "new vertical split" },
    ["<leader>o"] = { "<cmd>split<CR>", "new horizontal split" },

    ["<A-f>"] = { "<cmd>HopWord<CR>", "HopWord" },
    ["<A-c>"] = { "<cmd>HopWord<CR>" },
    ["<A-a>"] = { "<cmd>HopAnywhere<CR>" },

    ["<leader>gf"] = { "<cmd>GitBlameToggle<CR>" },

    ["<leader>gd"] = { "<cmd>LazyGit<CR>" },
    ["<leader>ld"] = { "<cmd>LazyDocker<CR>" },

    ["<leader>q"] = { "<cmd>DBUIToggle<CR>" },

    ["<leader>s"] = { "<cmd>Navbuddy<CR>", "Navbuddy Toggle" },

    ["<leader>fz"] = { "<cmd>ZenMode<CR>" },


    ["gpd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "goto definition" },
    ["<S-d>"] = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "goto reference" },
    ["gpi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "goto implementation" },
    ["gpf"] = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "goto type" },
    ["gpm"] = { "<cmd>lua require('goto-preview').goto_preview_declaration()<CR> ", "goto declaration" },
    ["<A-w>"] = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "close goto tabs" },

    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },



    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
  },

  v = {

    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },

    ["m"] = { "w" },
    ["n"] = { "b" },

    ["<A-f>"] = { "0" },
    ["f"] = { "$" },

    ["<A-q>"] = { "<Esc>" },

  },

  c = {

    ["<A-p>"] = { "<Backspace>" },
    ["<A-j>"] = { "<Enter>" },
    ["<A-m>"] = { "<Down>" },
    ["<A-n>"] = { "<Up>" },
    ["<A-h>"] = { "<Left>" },

  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ["<tab>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },

    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-j>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>w"] = { "<cmd>Telescope find_files<CR>" },

    ["<leader>d"] = { "<cmd>Telescope oldfiles<CR>" },
    ["<leader>j"] = { "<cmd>Telescope file_browser<CR>" },

    ["<leader><leader>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },

    ["<leader>ff"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },

    ["<leader>fa"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>l"] = { "<cmd>Telescope zoxide list<CR>" },
    ["<leader>["] = { "<cmd>Telescope notify<CR>" },
    ["<leader>pp"] = { "<cmd>Telescope package_info<CR>" },

    ["<leader>gc"] = { "<cmd>Telescope gitmoji<CR>" },

    ["<leader>gm"] = { "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "Change to worktree" },
    ["<leader>gn"] = { "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", "Create a new worktree " },

    ["<leader>ge"] = { "<cmd>Telescope emoji<CR>" },
  },
}

M.comment = {
  plugin = true,

  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = { -- Change it to be more usable
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    -- ["<leader>gb"] = {
    --   function()
    --     package.loaded.gitsigns.blame_line()
    --   end,
    --   "Blame line",
    -- },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>af"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>ac"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",

    },
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

-- Tmux Navigation
vim.api.nvim_set_keymap('n', '<A-k>', [[winnr('#') < 0 ? 'k' : ':TmuxNavigateUp<CR>']],
  { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', [[winnr('#') < 0 ? 'j' : ':TmuxNavigateDown<CR>']],
  { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', [[winnr('#') < 0 ? 'l' : ':TmuxNavigateRight<CR>']],
  { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', [[winnr('#') < 0 ? 'h' : ':TmuxNavigateLeft<CR>']],
  { expr = true, noremap = true, silent = true })

return M
