local options = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "unocss-language-server",
    "eslint-lsp",
    "eslint_d",
    "deno",
    "prettier",
    "json-lsp",

    "clangd",
    "clang-format",

    "gopls",

    "shfmt",
    "shellcheck",
    "bash-language-server",
  },

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

local mason_tool_installer = require "mason-tool-installer"
mason_tool_installer.setup(options.ensure_installed)

return options
