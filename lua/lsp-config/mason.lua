local servers = {
    "cssls",
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "jsonls",
    "lua_ls",
    "tsserver",
    "pyright",
    "yamlls",
    "bashls",
    "gopls",
}

local settings = {
    ui = {
        border = "rounded",
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require('mason').setup(settings)

require('mason-lspconfig').setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp-config.handlers").on_attach,
        capabilities = require("lsp-config.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
        local jsonls_opts = require "lsp-config.settings.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "yamlls" then
        local yamlls_opts = require "lsp-config.settings.yamlls"
        opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
    end

    if server == "lua_ls" then
        local luadev = require("lua-dev").setup {
            lspconfig = {
                on_attach = opts.on_attach,
                capabilities = opts.capabilities,
            },
        }
        lspconfig.lua_ls.setup(luadev)
        goto continue
    end

    if server == "tsserver" then
        local tsserver_opts = require "lsp-config.settings.tsserver"
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "lsp-config.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "emmet_ls" then
        local emmet_ls_opts = require "lsp-config.settings.emmet_ls"
        opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    lspconfig[server].setup(opts)
    ::continue::
end
