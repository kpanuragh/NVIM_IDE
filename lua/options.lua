local function set_options()
  -- Enable features
  vim.opt.mouse = "a" -- Enable mouse support
  vim.opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
  vim.opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

  -- UI and Display
  vim.opt.number = true -- Show line numbers
  vim.opt.showmatch = true -- Highlight matching parenthesis
  --vim.opt.colorcolumn = '80' -- Line length marker at 80 columns
  vim.opt.termguicolors = true -- Enable 24-bit RGB colors

  -- Tabs and Indentation
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.shiftwidth = 4 -- Shift 4 spaces when tab
  vim.opt.tabstop = 4 -- 1 tab == 4 spaces
  vim.opt.smartindent = true -- Autoindent new lines

  -- Other options
  vim.opt.ignorecase = true -- Ignore case letters when search
  vim.opt.smartcase = true -- Ignore lowercase for the whole pattern
  vim.opt.linebreak = true -- Wrap on word boundary
  vim.opt.laststatus = 3 -- Set global statusline
 -- For Nvim Tree
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  
end

return {
  set_options = set_options,
}

