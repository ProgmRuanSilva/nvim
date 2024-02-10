--@type NvPluginSpec
local overrides = require "custom.configs.overrides"

local plugins = {
-- Defaults
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
          -- "numToStr/Comment.nvim",
          -- "nvim-telescope/telescope.nvim",
        },
        opts = {
          lsp = { auto_attach = true },
        },
        setup = function()
          require"custom.configs.navbuddy"
        end,
      },

      {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        opts = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "custom.configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.nvimcmp,

    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          -- load default luasnip config
          require("plugins.configs.others").luasnip(opts)

          local luasnip = require "luasnip"
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          require("luasnip/loaders/from_vscode").lazy_load()
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "custom.configs.lint"
    end
  },

  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require"custom.configs.formatter"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

-- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim" },
    config = function ()
      require"custom.configs.telescope.file-browser"
    end
  },

  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim" },
    config = function ()
      require"custom.configs.telescope.zoxide"
    end
  },

  {
    "olacin/telescope-gitmoji.nvim",
    event = {"VeryLazy"},
    config = function ()
      require"custom.configs.telescope.gitmoji"
    end
  },

  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },

  --Text Edition
  {
    "max397574/better-escape.nvim",
    event = {"VimEnter"},
    config = function()
      require"custom.configs.better_escape"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = {"VimEnter"},
    config = function()
      require"custom.configs.autotag"
    end,
  },

  {
    "Wansmer/treesj",
    event = {"VimEnter"},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = false,
      }
    end,
  },

  {
    "MunifTanjim/prettier.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("custom.configs.prettier")
    end
  },

  -- Visual
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },


  {
    "nvim-lua/plenary.nvim",
    event = {"VimEnter"}
  },


  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        --We need configurate on surround file
      })
    end
  },

  {
    "hrsh7th/cmp-buffer",
    event = "VeryLazy",
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
    config = function ()
      require"custom.configs.cmp"
    end
  },

  {
    "itchyny/vim-cursorword",
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function ()
      require"custom.configs.noice"
    end
  },

  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
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
    "vuki656/package-info.nvim",
    event = "VeryLazy",
    config = function ()
      require('package-info').setup()
    end
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function ()
      vim.keymap.set('i', '<A-i>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      -- vim.keymap.set('i', '<A-[>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<A-]>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<A-[>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },

  -- {
  --   "glepnir/dashboard-nvim",
  --   event = {"VimEnter"},
  --   dependencies = {"nvim-tree/nvim-web-devicons"},
  --   config = function()
  --     require"custom.configs.dashboard"
  --   end,
  -- },

-----------------
--- TEST AREA----
-----------------

  {
    "nvim-telescope/telescope-dap.nvim",
    event = {"VimEnter"},
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("custom.configs.dadbod").setup()
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    event = "VeryLazy",
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "nooproblem/git-worktree.nvim",
    event = "VeryLazy",
  },

  {
    "xiyaowong/telescope-emoji.nvim",
    event = "VeryLazy",
  },

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

  -- {
  --   "",
  --   event = "VeryLazy",
  -- },


}
return plugins
