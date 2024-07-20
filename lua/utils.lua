local utils = {}

local function move_cursor()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
	local line_length = #line

	local midpoint = math.floor(line_length / 2)

	if col == 0 then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
	elseif col >= line_length - 1 or col == line_length then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Home>", true, false, true), "n", false)
	else
		if col <= midpoint then
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Home>", true, false, true), "n", false)
		else
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
		end
	end
end

utils.move_cursor = move_cursor
return utils
