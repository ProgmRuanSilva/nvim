return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		vim.keymap.set("i", "<A-i>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<A-z>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
		-- vim.keymap.set("i", "<A-y>", function()
		--   return vim.fn["codeium#CycleCompletions"](-1)
		-- end, { expr = true })
		vim.keymap.set("i", "<A-t>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true })
	end,
}
