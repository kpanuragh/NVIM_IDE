return {
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "javascript", "html","php","css","go"},
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
}
