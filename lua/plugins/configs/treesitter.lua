local options = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "c",
    "markdown",
    "markdown_inline",
    "bash",
    "c",
    "diff",
    "jsdoc",
    "json",
    "jsonc",
    "luadoc",
    "luap",
    "python",
    "query",
    "regex",
    "toml",
    "vimdoc",
    "yaml",
    "javascript",
    "typescript",
    "tsx",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      -- node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },

  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },

  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
    -- [options]
  },
}

return options
