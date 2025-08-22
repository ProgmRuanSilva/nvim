-- return {
-- 	"christoomey/vim-tmux-navigator",
-- 	event = "VimEnter",
-- 	config = function()
-- 		vim.g.tmux_navigator_disable_when_zoomed = true
-- 	end,
-- }
return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		-- { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		-- { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		-- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
