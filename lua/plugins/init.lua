return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				sh = { "bashls" },
				zsh = { "bashls" },
				bash = { "bashls" },
				ruby = { "solargraph" },
				erb = { "erb_formatter" },
				eruby = { "erb_formatter" },
				crystal = { "crystal " },
				kotlin = { "ktlint" },
			},
			formatters = {
				ktlint = {
					command = "ktlint",
					args = { "--format", "gradle", "$FILENAME" },
					stdin = false,
				},
				crystal = {
					command = "crystal",
					args = { "tool", "format", "$FILENAME" },
					stdin = false,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local servers = {
				"html",
				"cssls",
				"ts_ls",
				"bashls",
				"jsonls",
				"eslint",
				"pyright",
				"kotlin_language_server",
			}

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server)
			end
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				python = { "pylint" },
				ruby = { "erb_lint" },
			}
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",

				"css-lsp",
				"html-lsp",
				"typescript-language-server",
				"unocss-language-server",
				"eslint-lsp",
				"eslint_d",
				"deno",
				"prettier",
				"json-lsp",

				"clangd",
				"clang-format",

				"solargraph",
				"rubocop",
				"erb_lint",
				"erb_formatter",

				"gopls",

				"shellcheck",
				"bash-language-server",

				"pyright",
			},
		},

		PATH = "skip",

		ui = {
			icons = {
				package_pending = " ",
				package_installed = "󰄳 ",
				package_uninstalled = " 󰚌",
			},

			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},

		max_concurrent_installers = 10,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"html",
				"css",
				"c",
				"markdown",
				"markdown_inline",
				"bash",
				"c",
				"diff",
				"luadoc",
				"luap",
				"python",
				"query",
				"regex",
				"toml",
				"vimdoc",
				"yaml",
				"javascript",
				"typescript",
				"tsx",
				"kotlin",
			},

			auto_install = true,

			sync_install = false,

			additional_vim_regex_highlighting = false,

			highlight = {
				enable = true,
				disable = { "markdown", "markdown_inline", "vimdoc" },
			},

			indent = { enable = true },

			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					-- node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
	},

	{
		"numToStr/Comment.nvim",
		opts = function(_, opts)
			local status_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			if status_ok then
				opts.pre_hook = ts_context_commentstring.create_pre_hook()
			end
		end,
	},
}
