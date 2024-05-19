local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.cmd("MarkdownPreviewToggle")
	end,
})

autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})
