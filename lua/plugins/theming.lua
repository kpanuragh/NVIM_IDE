return {
    {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'config/catppuccin'
    end
},
      {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      }
    },
  }, 
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
-- setup rainbow-delimiters.nvim
{
        "HiPhish/rainbow-delimiters.nvim",
        config = function ()
     end
  },
      -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('config/bufferline')
        end
    },
}

