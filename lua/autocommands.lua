local lint = require("lint")
local autocmd = vim.api.nvim_create_autocmd
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

autocmd({ "VimResized" }, {
	command = "wincmd =",
})

autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.cmd("MarkdownPreviewToggle")
	end,
})

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})
