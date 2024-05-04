local conform = require "conform"

require("conform").setup {
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
    bash = { "shfmt" },
    ruby = { "rubocop" },
    erb = { "erb_formatter" },
    eruby = { "erb_formatter" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

vim.keymap.set({ "n" }, "gf", function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  }
end, { desc = "Format file or range (in visual mode)" })
