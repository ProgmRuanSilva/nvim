local autocmd = vim.api.nvim_create_autocmd
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		require("lint").try_lint()
	end,
})
