return {
    {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
      require("tokyonight").setup({})
      vim.cmd.colorscheme "tokyonight-moon"
  end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
      theme = 'tokyonight',
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    -- i don't think lazy will be able to guess 
    -- `ibl` is the main module, so set it manually
    main = 'ibl',
    opts = {
      enabled = true,
      scope = {
        enabled = false,
      },
      indent = {
        char = '▏',
      },
    }
  }
}

