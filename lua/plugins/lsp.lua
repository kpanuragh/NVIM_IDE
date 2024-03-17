return{
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
       config = function()
        require('config/lsp')
       end
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    "saadparwaiz1/cmp_luasnip",
    {
        "hrsh7th/nvim-cmp",
        config =  function()
        require("config/cmp")
        end
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            require('lspkind').init({
                symbol_map = {
                    Copilot = "",
                },
            })
        end
    }

}
