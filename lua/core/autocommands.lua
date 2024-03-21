local autocmd = vim.api.nvim_create_autocmd

-- Change between tabs with numbers
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end

autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.cmd "MarkdownPreviewToggle"
  end,
})

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- autocmd("BufWritePre", {
--   pattern = "*",
--   command = "OrganizeImports",
-- })
