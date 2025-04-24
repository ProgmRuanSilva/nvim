return {
	{
		"olimorris/codecompanion.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.diff",
		},
		opts = {
			adapters = {
				-- openai = function()
				-- 	return require("codecompanion.adapters").extend("openai", {
				-- 		name = "openai",
				-- 		schema = {
				-- 			model = {
				-- 				default = "gpt-3.5-turbo",
				-- 			},
				-- 			num_ctx = {
				-- 				default = 4096,
				-- 			},
				-- 			num_predict = {
				-- 				default = -1,
				-- 			},
				-- 		},
				-- 	})
				-- end,
				qwen = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "qwen",
						schema = {
							model = {
								default = "qwen2.5-coder:14b",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
				deepseek = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "deepseek",
						schema = {
							model = {
								default = "deepseek-r1:14b",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
				llama = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "llama",
						schema = {
							model = {
								default = "llama3:latest",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "qwen",
					keymaps = {
						send = {
							modes = { n = "<A-e>", i = "<A-e>" },
						},
						close = {
							modes = { n = "<A-w>", i = "<A-w>" },
						},
					},
				},
				inline = {
					adapter = "qwen",
					layout = "vertical", -- vertical | horizontal | buffer
					keymaps = {
						accept_change = {
							modes = { n = "ga" },
							description = "Accept the suggested change",
						},
						reject_change = {
							modes = { n = "gf" },
							description = "Reject the suggested change",
						},
					},
				},
			},
			display = {
				diff = {
					enabled = true, -- Enable diff view with @editor
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "default", -- default|mini_diff
				},
				action_palette = {
					width = 100,
					height = 15,
					prompt = "Prompt ", -- Prompt used for interactive LLM calls
					provider = "default", -- default|telescope|mini_pick
					opts = {
						show_default_actions = true, -- Show the default actions in the action palette?
						show_default_prompt_library = true, -- Show the default prompt library in the action palette?
					},
				},
				chat = {
					intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
					show_header_separator = true, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
					separator = "─", -- The separator between the different messages in the chat buffer
					show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
					show_settings = false, -- Show LLM settings at the top of the chat buffer?
					show_token_count = true, -- Show the token count for each response?
					start_in_insert_mode = true, -- Open the chat buffer in insert mode?
					icons = {
						pinned_buffer = " ",
						watched_buffer = "👀 ",
					},
					window = {
						layout = "vertical", -- float|vertical|horizontal|buffer
						position = "left", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
						border = "single",
						height = 0.8,
						width = 0.30,
						relative = "editor",
						spell = true,
						opts = {
							breakindent = true,
							cursorcolumn = false,
							cursorline = false,
							foldcolumn = "0",
							linebreak = true,
							list = false,
							numberwidth = 1,
							signcolumn = "no",
							spell = true,
							wrap = true,
						},
					},
				},
			},
		},
		keys = {},
	},
}
