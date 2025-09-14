return {
	{
		"olimorris/codecompanion.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"ravitemer/mcphub.nvim",
			"HakonHarnes/img-clip.nvim",
		},
		opts = {
			adapters = {
				acp = {
					gemini_cli = function()
						return require("codecompanion.adapters").extend("gemini_cli", {
							defaults = {
								auth_method = "gemini-api-key",
								mcpServers = {},
								timeout = 20000, -- 20 seconds
							},
							env = {
								GEMINI_API_KEY = "AIzaSyA8ncnYdTn60ACoXyjKoLfaPoJoudnoGHE",
							},
						})
					end,
				},
				http = {
					qwen = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "qwen",
							opts = {
								vision = true,
								stream = true,
							},
							schema = {
								model = {
									default = "qwen3:14b",
								},
								num_ctx = {
									default = 16384,
								},
								think = {
									default = false,
								},
								keep_alive = {
									default = "5m",
								},
							},
						})
					end,
					deepseek = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "deepseek",
							opts = {
								vision = true,
								stream = true,
							},
							schema = {
								model = {
									default = "deepseek-r1:14b-qwen-distill-q8_0",
								},
								num_ctx = {
									default = 16384,
								},
								keep_alive = {
									default = "5m",
								},
								think = {
									default = true,
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
					openai = function()
						return require("codecompanion.adapters").extend("openai", {
							-- env = {
							-- 	api_key = "cmd: gpg --batch --quiet --decrypt /home/dev/.gnupg/public-keys.d/api_key.gpg",
							-- },
							schema = {
								model = {
									default = "gpt-3.5-turbo",
									-- default = "gpt-4.1-nano",
								},
								num_ctx = {
									default = 4096,
								},
								num_predict = {
									default = -1,
								},
							},
						})
					end,
				},
			},
			send_code = true,
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true, -- Convert resources to #variables
						show_result_in_chat = true, -- Show mcp tool results in chat
						make_slash_commands = true, -- Add prompts as /slash commands
					},
				},
			},
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
			strategies = {
				chat = {
					adapter = "gemini_cli",
					keymaps = {
						send = {
							modes = { n = "<C-e>", i = "<C-e>" },
						},
						close = {
							modes = { n = "<C-r>", i = { "<C-r>", "<leader>aa" } },
						},
					},
				},
				inline = {
					adapter = "gemini_cli",
					layout = "vertical", -- vertical | horizontal | buffer
					-- keymaps = {
					-- 	accept_change = {
					-- 		modes = { n = "ee" },
					-- 		description = "Accept the suggested change",
					-- 	},
					-- 	reject_change = {
					-- 		modes = { n = "ef" },
					-- 		description = "Reject the suggested change",
					-- 	},
					-- },
				},
			},
			display = {
				diff = {
					enabled = true, -- Enable diff view with @editor
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
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
					show_token_count = false, -- Show the token count for each response?
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
						width = 0.35,
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
