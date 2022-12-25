local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)


-- BarBar Mappings

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Buffer Pick
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Telescope  Mappings
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fl', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fg', ':Telescope git_commits<CR>', opts)

-- Java Mappings
map('n', '<leader>ji', ':lua require("jdtls").organize_imports()<CR>', opts)

local spring_boot_start = './gradlew bootRun -Dspring-boot.run.profiles=default'
local command = ':lua require("toggleterm").exec("' .. spring_boot_start .. '")<CR>'
map('n', '<leader>js', command, opts)
