return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				-- typescript = { "prettier" },
				typescript = { "biome" },
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
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		config = function()
			require("nvim-treesitter").setup({
				-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local ensure_installed = {
				"vim",
				"lua",
				"html",
				"css",
				"c",
				"markdown",
				"markdown_inline",
				"bash",
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
				"tmux",
			}
			local task = require("nvim-treesitter").install(ensure_installed)
			if task then
				task:wait(120000)
			end

			-- Enable syntax highlighting, folding and indentation
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					local disabled_fts = { "markdown", "markdown_inline", "vimdoc" }
					local ft = vim.bo[args.buf].filetype
					if not vim.tbl_contains(disabled_fts, ft) then
						pcall(vim.treesitter.start, args.buf)
					end
					-- Indent
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					-- Folds
					vim.api.nvim_set_option_value(
						"foldexpr",
						"v:lua.vim.treesitter.foldexpr()",
						{ scope = "local", win = 0 }
					)
					vim.api.nvim_set_option_value("foldmethod", "expr", { scope = "local", win = 0 })
				end,
			})
		end,
	},

	{
		"numToStr/Comment.nvim",
		opts = function(_, opts)
			local status_ok, ts_context_commentstring =
				pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			if status_ok then
				opts.pre_hook = ts_context_commentstring.create_pre_hook()
			end
		end,
	},
}
