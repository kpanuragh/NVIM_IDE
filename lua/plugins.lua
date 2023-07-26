return {
    {
        "goolord/alpha-nvim",
        lazy = true,
    },
    {
        "windwp/nvim-autopairs"
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme dracula]])
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    -- Indentation Highlighting
    {
        "lukas-reineke/indent-blankline.nvim",
    },

    -- Rainbow Highlighting
    {
        "HiPhish/nvim-ts-rainbow2",
    },
    -- Lualine (THE NEW EXTENSION ADDED IN CONFIGURATION)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Hop (Better Navigation)
    {
        "phaazon/hop.nvim",
        lazy = true,
    },
    -- Language Support
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
                        -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional
            {'onsails/lspkind.nvim'},
            {'simrat39/inlay-hints.nvim'},
            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },
    {'kevinhwang91/nvim-ufo',dependencies='kevinhwang91/promise-async'},
    -- Nvimtree (File Explorer)
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    -- Nvim-Surround (Manipulating Surroundings)
    -- Installed this plugin
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
        }
    },
    -- Toggle Term
    {
        'akinsho/toggleterm.nvim',
        config = true
    },
    {
        "nvim-treesitter/nvim-treesitter",
    },
    -- Undo-Tree
    {
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        "AstroNvim/astrocommunity",
        { import = "astrocommunity.media.presence-nvim" },
        {
            "presence.nvim",
            opts = {
                client_id = "793271441293967371",
                main_image = "file",
                file_assets = {
                    php = { "PHP", "https://raw.githubusercontent.com/kpanuragh/icons/main/php_elephant_pink.png" },
                    js = { "Javascript", "https://raw.githubusercontent.com/kpanuragh/icons/main/javascript.png" },
                    css = { "CSS", "https://raw.githubusercontent.com/kpanuragh/icons/main/css.png" },
                    html = { "HTML", "https://raw.githubusercontent.com/kpanuragh/icons/main/html.png" },
                    ["nil"] = { "Debuging",
                        "https://raw.githubusercontent.com/kpanuragh/icons/main/folder-debug-open.png" }
                }
            }
        }
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }
    ,
     {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    } 
}
