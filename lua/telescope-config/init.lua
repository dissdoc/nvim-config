require("telescope").setup {
    pickers = {
        live_grep = {
            theme = "dropdown",
        },
        grep_string = {
            theme = "dropdown",
        },
        find_files = {
            theme = "dropdown",
            previewer = false,
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
        },
        planets = {
            show_pluto = true,
            show_moon = true,
        },
        colorscheme = {
            -- enable_preview = true,
        },
        lsp_references = {
            theme = "dropdown",
            initial_mode = "normal",
        },
        lsp_definitions = {
            theme = "dropdown",
            initial_mode = "normal",
        },
        lsp_declarations = {
            theme = "dropdown",
            initial_mode = "normal",
        },
        lsp_implementations = {
            theme = "dropdown",
            initial_mode = "normal",
        },
    },
}
