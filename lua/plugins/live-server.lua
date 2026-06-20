return {
	"barrettruth/live-server.nvim",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = function()
		vim.g.live_server = {
			port = 3000,
			browser = false,
		}
	end,
}
