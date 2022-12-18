:set number
:set relativenumber
:set autoindent
:set encoding=utf-8
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'

" Common config
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/completion-nvim'

" File icons
Plug 'kyazdani42/nvim-web-devicons'

" Status line 
Plug 'hoob3rt/lualine.nvim'

" Nerd Tree
Plug 'https://github.com/preservim/nerdtree'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Markdown editor
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :MarkdownPreview<CR>

nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>

" Lua general
lua << EOF

local nvim_lsp = require('lspconfig')

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
	  n = {
	    ["q"] = actions.close
	  },
	},
  }
}

EOF

" Lualine Config
lua << EOF
require('lualine').setup {
	options = { theme = 'gruvbox' }
}
EOF

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF
