return require('packer').startup(function()
    
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'

    use 'EdenEast/nightfox.nvim'
    
    use 'nvim-tree/nvim-tree.lua'
    
    use 'rcarriga/nvim-notify' -- Notification plugin
    use 'nvim-lualine/lualine.nvim' -- Bottom vim status line
    use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'windwp/nvim-ts-autotag'

    -- Format code
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Add terminal
    use 'akinsho/toggleterm.nvim'

    -- scheme formatters
    use "b0o/schemastore.nvim"

    -- LSP Server and Plugins
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'lvimuser/lsp-inlayhints.nvim'
    use "christianchiarulli/lua-dev.nvim"

    -- Simple lines
    use 'ErichDonGubler/lsp_lines.nvim' 

    -- Tiny statusline component
    use 'SmiteshP/nvim-navic'

    use 'lewis6991/gitsigns.nvim'
    
    use 'mfussenegger/nvim-jdtls'

    use 'onsails/lspkind-nvim' -- Set icons at the right of completion
end)
