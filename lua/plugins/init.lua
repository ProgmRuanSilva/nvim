-- TODO: Create a autocommand to rezise the pane
return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
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
				"jsdoc",
				"json",
				"jsonc",
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
			},

			auto_install = true,

			sync_install = false,

			additional_vim_regex_highlighting = false,

			highlight = {
				enable = true,
				use_languagetree = true,
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

			keys = {
				{ "<c-space>", desc = "Increment selection" },
				{ "<bs>", desc = "Decrement selection", mode = "x" },
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			require("configs.telescope")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function()
			require("configs.cmp")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			require("configs.nvimtree")
		end,
	},

	{
		"numToStr/Comment.nvim",
		opts = function(_, opts)
			local ft = vim.bo.filetype
			if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
				require("Comment").setup({
					pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				})
			end
			require("Comment").setup(opts)
		end,
	},
}
