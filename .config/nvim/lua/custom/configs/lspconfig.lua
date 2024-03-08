local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
		},
	},
})

--
-- lspconfig.pyright.setup { blabla}
