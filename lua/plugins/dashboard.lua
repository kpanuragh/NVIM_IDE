return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		lazy = true,
		config = function()
			require("dashboard").setup({
				theme = "hyper", -- Choose a theme or create your own
				disable_move = false, -- Allow moving the dashboard with keybindings
				disable_close = false, -- Allow closing the dashboard with keybindings
				shortcut_type = "letter", -- Shortcut type ('letter' or 'number')
				change_to_vcs_root = false, -- Open files in Hyper's MRU at VCS root
				config = {
					week_header = { enable = true }, -- Enable week header
					hide = {
						statusline = true, -- Hide statusline
						tabline = true, -- Hide tabline
						winbar = true, -- Hide winbar
					},
                project = {enable = false},
				}
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
