-- Open preview when opening a markdown file
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md", "*.nvim" },
	callback = function()
		vim.cmd("MarkdownPreviewToggle")
	end,
})

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown", ".md", ".nvim" }
	end,
	ft = { "markdown" },
}
