require'nvim-treesitter.configs'.setup {

    ensure_installed = {
        'python',
        'lua',
        'javascript',
        'typescript',
        'html',
        'yaml',
        'json',
        'go',
    },

    sync_install = false,

    autopairs = {
        enable = true,
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = true,
    },

    autotag = {
        enable = true,
        filetypes = {
            'python',
            'lua',
            'typescript',
            'javascript',
            'html',
            'json',
            'yaml',
            'go',
        },
    },

    refactor = {
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
}
