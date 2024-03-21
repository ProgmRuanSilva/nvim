-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local default_plugins = {

  "nvim-lua/plenary.nvim",

  {
    "NvChad/base46",
    branch = "v2.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "NvChad/ui",
    branch = "v2.0",
    lazy = false,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require "nvchad.icons.devicons" }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    main = "ibl",
    config = function()
      require "plugins.configs.ibl"
    end,
  },

  {
    "echasnovski/mini.indentscope",
    event = "User FilePost",
    config = function()
      require "plugins.configs.identscope"
    end,
    opts = {
      symbol = "▏",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    tag = "v0.9.2",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require "nvim-treesitter.query_predicates"
    end,
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- {
  --   "andymass/vim-matchup",
  --   event = { "VeryLazy" },
  --   setup = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
    config = function()
      require "plugins.configs.treesitterContext"
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require("plugins.configs.others").gitsigns
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
  },

  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim", --maybe break lsp configuration check
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = "nvim-lspconfig" },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      local ft = vim.bo.filetype
      if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
        require("Comment").setup {
          pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
      end
      require("Comment").setup(opts)
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = { "BufReadPost", "BufNewFile" },
    ft = { ".tsx", ".jsx" },
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings "whichkey"
    end,
    cmd = "WhichKey",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },

  --- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "nooproblem/git-worktree.nvim",
    event = "VeryLazy",
  },

  {
    "changa/telescope-emoji.nvim",
    event = "VeryLazy",
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require "plugins.configs.file-browser"
    end,
  },

  {
    "jvgrootveld/telescope-zoxide",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim" },
    config = function()
      require "plugins.configs.zoxide"
    end,
  },

  {
    "olacin/telescope-gitmoji.nvim",
    event = { "VeryLazy" },
    config = function()
      require "plugins.configs.gitmoji"
    end,
  },

  -- Navigation
  {
    "declancm/cinnamon.nvim",
    event = { "VimEnter" },
    config = function()
      require "plugins.configs.cinnamon"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },

  {
    "mistweaverco/hop.nvim",
    event = { "VeryLazy" },
    config = function()
      require "plugins.configs.hop"
    end,
  },

  {
    "mg979/vim-visual-multi",
    event = { "VimEnter" },
    enabled = true,
  },

  {
    "mattn/emmet-vim",
    event = { "VimEnter" },
    enabled = true,
  },

  {
    "rmagatti/goto-preview",
    event = "VeryLazy",
    config = function()
      require("goto-preview").setup {
        width = 120, -- Width of the floating window
        height = 20, -- Height of the floating window
        border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters of the floating window
        default_mappings = false,
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        references = { -- Configure the telescope UI for slowing the references cycling window.
          telescope = require "telescope",
        },
        focus_on_open = true, -- Focus the floating window when opening it.
        dismiss_on_move = true, -- Dismiss the floating window when moving the cursor.
        force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
        bufhidden = "delete", -- the bufhidden option to set on the floating window. See :h bufhidden
        stack_floating_preview_windows = true, -- Whether to nest floating windows
        same_file_floating_window_appears = true,
        preview_window_title = { enable = true, position = "left" }, -- Whether
      }
    end,
  },

  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<A-i>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<A-z>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      -- vim.keymap.set("i", "<A-y>", function()
      --   return vim.fn["codeium#CycleCompletions"](-1)
      -- end, { expr = true })
      vim.keymap.set("i", "<A-t>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },

  {
    "vuki656/package-info.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.package"
    end,
  },

  {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("plugins.configs.dadbod").setup()
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    event = "VeryLazy",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_winwidth = 50
    end,
    config = function()
      require "plugins.configs.dadbod"
    end,
  },

  -- Visual
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "plugins.configs.zenmode"
    end,
  },

  --Text Edition
  {
    "max397574/better-escape.nvim",
    event = { "VimEnter" },
    config = function()
      require "plugins.configs.better_escape"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "VimEnter" },
    config = function()
      require "plugins.configs.autotag"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        --We need configurate on surround file
      }
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "plugins.configs.noice"
    end,
  },

  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require "plugins.configs.octo"
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "plugins.configs.dashboard"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.dressing"
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    opts = function()
      require "plugins.configs.trouble"
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
    },
  },

  -- {
  --   "itchyny/vim-cursorword",
  --   event = "VeryLazy",
  -- },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    cmd = { "TodoTrouble", "TodoTelescope" },
    opts = {
      {
        signs = true, -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE", -- The gui style to use for the fg highlight group.
          bg = "BOLD", -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true, -- enable multine todo comments
          multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
          before = "", -- "fg" or "bg" or empty
          keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg", -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
          max_line_len = 400, -- ignore lines longer than this
          exclude = {}, -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" },
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
      under_cursor = false,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("<S-l>", "next")
      map("<S-h>", "prev")

      -- also set it after loading ftplugins, since a lot overwrite ll and ll
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("<S-l>", "next", buffer)
          map("<S-h>", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "<S-l>", desc = "Next Reference" },
      { "<S-h>", desc = "Prev Reference" },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "plugins.configs.lint"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "plugins.configs.conform"
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = function()
      require "plugins.configs.ufo"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", ".md" }
    end,
    ft = { "markdown" },
  },

  {
    "numToStr/FTerm.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.fterm"
    end,
  },

  -- { --This plugin complement the hop.nvim
  --   "echasnovski/mini.animate",
  --   event = "VimEnter",
  --   config = function()
  --     local animate = require "mini.animate"
  --     require("mini.animate").setup {
  --       cursor = {
  --         enable = true,
  --         timing = animate.gen_timing.linear { duration = 85, unit = "total" },
  --       },
  --       scroll = {
  --         enable = false,
  --       },
  --       close = {
  --         enable = false,
  --       },
  --       open = {
  --         enable = false,
  --       },
  --       resize = {
  --         enable = false,
  --       },
  --     }
  --   end,
  -- },
  -- Make this plugin works with every based on cinnamon

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },
}

-- FTerm Mapping
vim.keymap.set("n", "<leader>l", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-r>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

local config = require("core.utils").load_config()

if #config.plugins > 0 then
  table.insert(default_plugins, { import = config.plugins })
end

require("lazy").setup(default_plugins, config.lazy_nvim)
