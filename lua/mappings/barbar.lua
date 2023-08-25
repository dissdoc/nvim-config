local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- BarBar Mappings
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Buffer Pick
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
