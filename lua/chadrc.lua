-- -- This file  needs to have same structure as nvconfig.lua
-- -- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
--
-- ---@type ChadrcConfig
-- local M = {}
-- M.ui = {
-- 	------------------------------- base46 -------------------------------------
-- 	-- hl = highlights
-- 	-- hl_add = {
-- 	-- },
-- 	-- hl_override = {
-- 	-- },
-- 	-- changed_themes = {},
-- 	-- theme_toggle = { "onedark", "one_light" },
-- 	theme = "chadracula", -- default theme
-- 	transparency = true,
-- 	lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
--
-- 	-- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
-- 	extended_integrations = { "notify", "noice", "todo" }, -- these aren't compiled by default, ex: "alpha", "notify"
-- },
--
-- 	-- cmp themeing
-- 	M.cmp = {
-- 		icons = true,
-- 		lspkind_text = true,
-- 		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
-- 		border_color = "chadracula", -- only applicable for "default" style, use color names from base30 variables
-- 		selected_item_bg = "colored", -- colored / simple
-- 	},
--
-- 	M.telescope = { style = "bordered" }, -- borderless / bordered
--
-- 	------------------------------- nvchad_ui modules -----------------------------
-- 	statusline = {
-- 		theme = "minimal", -- default/vscode/vscode_colored/minimal
-- 		-- default/round/block/arrow separators work only for default statusline theme
-- 		-- round and block will work for minimal theme only
-- 		separator_style = "round",
-- 		overriden_modules = nil,
-- 	},
--
-- 	-- lazyload it when there are 1+ buffers
-- 	tabufline = {
-- 		show_numbers = false,
-- 		enabled = true,
-- 		lazyload = true,
-- 		overriden_modules = nil,
-- 	},
--
-- 	-- nvdash (dashboard)
-- 	nvdash = {
-- 		load_on_startup = false,
--
-- 		header = {
-- 			"           ▄ ▄                   ",
-- 			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
-- 			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
-- 			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
-- 			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
-- 			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
-- 			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
-- 			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
-- 			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
-- 		},
--
-- 		buttons = {
-- 			{ "  Find File", "Spc f f", "Telescope find_files" },
-- 			{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
-- 			{ "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
-- 			{ "  Bookmarks", "Spc m a", "Telescope marks" },
-- 			{ "  Themes", "Spc t h", "Telescope themes" },
-- 			{ "  Mappings", "Spc c h", "NvCheatsheet" },
-- 		},
-- 	},
--
-- 	cheatsheet = { theme = "grid" }, -- simple/grid
--
-- 	lsp = {
-- 		signature = false,
-- 	},
--
-- return M

local options = {

	base46 = {
		theme = "chadracula", -- default theme
		hl_add = {},
		hl_override = {},
		integrations = {},
		changed_themes = {},
		transparency = true,
		theme_toggle = { "onedark", "one_light" },
	},

	ui = {
		cmp = {
			icons = true,
			lspkind_text = true,
			style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		},

		telescope = { style = "borderless" }, -- borderless / bordered

		statusline = {
			theme = "minimal", -- default/vscode/vscode_colored/minimal
			-- default/round/block/arrow separators work only for default statusline theme
			-- round and block will work for minimal theme only
			separator_style = "round",
			order = nil,
			modules = nil,
		},

		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
		},

		nvdash = {
			load_on_startup = false,

			header = {
				"           ▄ ▄                   ",
				"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
				"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
				"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
				"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
				"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
				"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
				"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
				"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
			},

			buttons = {
				{ "  Find File", "Spc f f", "Telescope find_files" },
				{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
				{ "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
				{ "  Bookmarks", "Spc m a", "Telescope marks" },
				{ "  Themes", "Spc t h", "Telescope themes" },
				{ "  Mappings", "Spc c h", "NvCheatsheet" },
			},
		},
	},

	term = {
		winopts = { number = false, relativenumber = false },
		sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
		float = {
			relative = "editor",
			row = 0.3,
			col = 0.25,
			width = 0.5,
			height = 0.4,
			border = "single",
		},
	},

	lsp = { signature = false },

	cheatsheet = {
		theme = "grid", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},

	mason = { cmd = true, pkgs = {} },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
