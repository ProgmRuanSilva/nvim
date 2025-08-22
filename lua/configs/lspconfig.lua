local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"html",
	"cssls",
	"jsonls",
	"ts_ls",
	"eslint",
	"bashls",
	"bashls",
	"pyright",
	"kotlin-language-server",
	-- "solargraph",
	-- "gopls",
	-- "crystalline",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { ".tsx", ".ts", ".js", ".mjs", ".cjs" },
	init_options = {
		preferences = {
			disableSuggestions = false,
		},
	},
})

lspconfig.ts_ls.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = true
	end,
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = false,
		},
	},
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "json", "jsonc" },
})

lspconfig.rust_analyzer.setup({
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = false
	end,
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			disableSuggestions = false,
		},
	},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.kotlin_language_server.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { "kotlin", "kt", "kts" },
})
