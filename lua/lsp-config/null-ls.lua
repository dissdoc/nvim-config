local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {
	b.formatting.eslint_d,
	b.formatting.stylua.with({ filetypes = { "lua" } }),
	b.formatting.autopep8,
	b.formatting.prettierd.with({ filetypes = { "html", "yaml", "markdown" } }),

	b.diagnostics.markdownlint,
	-- b.diagnostics.shellcheck,

	-- python
	b.diagnostics.flake8,

	-- code actions
	b.code_actions.gitsigns,
	b.code_actions.gitrebase,

	-- hover
	b.hover.dictionary,

    -- golang
    b.formatting.gofumpt,
    b.formatting.goimports_reviser,
    b.formatting.golines,
}

null_ls.setup({
	sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
