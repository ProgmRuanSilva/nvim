local lint = require("lint")
local autocmd = vim.api.nvim_create_autocmd
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
local github_augroup = vim.api.nvim_create_augroup("Github", { clear = true })

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

autocmd("VimEnter", {
	group = github_augroup,
	callback = function()
		vim.cmd("Octo notification")
	end,
})

vim.api.nvim_create_autocmd("BufDelete", {
	callback = function()
		local bufs = vim.t.bufs
		if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
			vim.cmd("Dashboard")
		end
	end,
})
