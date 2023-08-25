local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Telescope  Mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fl", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fg", ":Telescope git_status<CR>", opts)
map("n", "<leader>fb", ":Telescope dap list_breakpoints<CR>", opts)
