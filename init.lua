-- Load required modules
local options = require("options")
 local mappings = require("mappings")
 local autocmds = require("autocmds")
local plugins = require("plugin")
-- Set global Neovim options
options.set_options()

-- Define key mappings and abbreviations
 mappings.setup_mappings()

-- Set up autocommands for specific events
 autocmds.setup_autocmds()

-- Load and configure plugins
plugins.init_plugins()
