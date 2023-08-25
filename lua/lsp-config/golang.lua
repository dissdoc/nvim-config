local status_ok, lspconf = pcall(require, "lspconfig")
if not status_ok then
	return
end

local on_attach = require("lsp-config.handlers").on_attach
local capabilities = require("lsp-config.handlers").capabilities

local util = require("lspconfig/util")

lspconf.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            }
        },
    },
})
