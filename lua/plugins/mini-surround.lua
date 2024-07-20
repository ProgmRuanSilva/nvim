return {
	"echasnovski/mini.surround",
	event = "VeryLazy",
	config = function()
		local surround = require("mini.surround")

		local ts_input = require("mini.surround").gen_spec.input.treesitter
		require("mini.surround").setup({
			-- No need to copy this inside `setup()`. Will be used automatically.
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.

			-- Make `)` insert parts with spaces. `input` pattern stays the same.
			[")"] = { output = { left = "( ", right = " )" } },

			-- Use function to compute surrounding info
			["*"] = {
				input = function()
					local n_star = surround.user_input("Number of * to find: ")
					local many_star = string.rep("%*", tonumber(n_star) or 1)
					return { many_star .. "().-()" .. many_star }
				end,
				output = function()
					local n_star = surround.user_input("Number of * to output: ")
					local many_star = string.rep("*", tonumber(n_star) or 1)
					return { left = many_star, right = many_star }
				end,
			},
			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 500,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sc", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "n", -- Suffix to search with "prev" method
				suffix_next = "m", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			silent = false,

			custom_textobjects = {
				f = ts_input({ outer = "@call.outer", inner = "@call.inner" }),
			},
		})
	end,
}
