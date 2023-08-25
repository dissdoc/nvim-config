local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

function open_debugging_sidebar()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end

function debug_go_test()
	require("dap-go").debug_test()
end

function debug_last_go_test()
	require("dap-go").debug_last()
end

map("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)

vim.keymap.set("n", "<leader>dus", function()
	open_debugging_sidebar()
end)
vim.keymap.set("n", "<leader>dgt", function()
	debug_go_test()
end)
vim.keymap.set("n", "<leader>dgl", function()
	debug_last_go_test()
end)
