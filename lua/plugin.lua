local function install_lazy()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end
local function init_plugins()
    install_lazy()
    require('lazy').setup({
        {import = 'plugins'},
    })

end

return {
  init_plugins = init_plugins,
}


