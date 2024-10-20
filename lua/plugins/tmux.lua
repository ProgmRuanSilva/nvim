return {
	"christoomey/vim-tmux-navigator",
	event = "VimEnter",
	config = function()
		vim.g.tmux_navigator_disable_when_zoomed = true
	end,
}
