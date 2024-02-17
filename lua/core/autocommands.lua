local autocmd = vim.api.nvim_create_autocmd

-- Change between tabs with numbers
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

-- Autoformat
-- autocmd({"BufWritePost"},
--     {
--       pattern = "*.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss,*.md,*.html,*.yaml",
--       callback = function()
--         vim.cmd("silent !black --quiet %")
--         vim.cmd("Prettier")
--         vim.cmd("silent w")
--       end,
--     }
--   )

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
