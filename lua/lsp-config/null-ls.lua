local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	b.formatting.eslint_d,
	b.formatting.stylua.with({ filetypes = { "lua" } }),
	b.formatting.autopep8,
	b.formatting.google_java_format.with({ filetypes = { "java" } }),
	b.formatting.prettierd.with({ filetypes = { "html", "yaml", "markdown" } }),

	b.diagnostics.markdownlint,
	b.diagnostics.shellcheck,

	-- python
	b.diagnostics.flake8,

	-- code actions
	b.code_actions.gitsigns,
	b.code_actions.gitrebase,

	-- hover
	b.hover.dictionary,
}

null_ls.setup({
	sources = sources,
})
