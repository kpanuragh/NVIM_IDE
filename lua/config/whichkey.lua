local wk = require("which-key")
wk.add({
  { "<leader>f", group = "File" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fs","<cmd>Telescope live_grep<cr>", desc="Live Grep" },
  { "<leader>e","<cmd>NvimTreeToggle<CR>", desc="Explore" },
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {"<leader>g",group="Git"},
  { "<leader>gn","<cmd>Neogit<CR>", desc="Neogit" },
  { "<leader>gb","<cmd>Gitsigns toggle_current_line_blame<CR>", desc="Blame" },
  { "<leader>gc","<cmd>Telescope git_commits<CR>", desc="Commits" },
  {'<leader>l',group='Code'},
{'<leader>ld','<cmd>lua vim.lsp.buf.definition()<CR>',desc='Go to Definition'},
{'<leader>lr','<cmd>lua vim.lsp.buf.references()<CR>',desc='Find References'},
{'<leader>lf','<cmd>lua require("conform").format({ async = true, lsp_fallback = true })<CR>',desc='Format'},
{'<leader>la','<cmd>lua vim.lsp.buf.code_action()<CR>',desc='Code Action'},
{'<leader>ls','<cmd>lua vim.lsp.buf.signature_help()<CR>',desc='Signature Help'},
{'<leader>lh','<cmd>lua vim.lsp.buf.hover()<CR>',desc='Hover'},
{'<leader>lp','<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>',desc='Document Symbols'},
{'<leader>lP','<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>',desc='Workspace Symbols'},
{'<leader>lR','<cmd>lua require("telescope.builtin").lsp_references()<CR>',desc='References'},
{'<leader>lS','<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',desc='Dynamic Workspace Symbols'},
{'<leader>t',group='Terminal'},
{'<leader>tt','<cmd>ToggleTerm<CR>',desc='Toggle Terminal'},
{'<leader>tn','<cmd>ToggleTerm<CR>',desc='New Terminal'},
{'<leader>tc','<cmd>ToggleTerm<CR>',desc='Close Terminal'},
})



-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
-- 	return
-- end
-- local telescope = require("telescope.builtin")
-- local setup = {
-- 	plugins = {
-- 		marks = true, -- shows a list of your marks on ' and `
-- 		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
-- 		spelling = {
-- 			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
-- 			suggestions = 20, -- how many suggestions should be shown in the list?
-- 		},
-- 		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
-- 		-- No actual key bindings are created
-- 		presets = {
-- 			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
-- 			motions = true, -- adds help for motions
-- 			text_objects = true, -- help for text objects triggered after entering an operator
-- 			windows = true, -- default bindings on <c-w>
-- 			nav = true, -- misc bindings to work with windows
-- 			z = true, -- bindings for folds, spelling and others prefixed with z
-- 			g = true, -- bindings for prefixed with g
-- 		},
-- 	},
-- 	-- add operators that will trigger motion and text object completion
-- 	-- to enable all native operators, set the preset / operators plugin above
-- 	-- operators = { gc = "Comments" },
-- 	key_labels = {
-- 		-- override the label used to display some keys. It doesn't effect WK in any other way.
-- 		-- For example:
-- 		-- ["<space>"] = "SPC",
-- 		-- ["<cr>"] = "RET",
-- 		-- ["<tab>"] = "TAB",
-- 	},
-- 	icons = {
-- 		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
-- 		separator = "➜", -- symbol used between a key and it's label
-- 		group = "+", -- symbol prepended to a group
-- 	},
-- 	popup_mappings = {
-- 		scroll_down = "<c-d>", -- binding to scroll down inside the popup
-- 		scroll_up = "<c-u>", -- binding to scroll up inside the popup
-- 	},
-- 	window = {
-- 		border = "rounded", -- none, single, double, shadow
-- 		position = "bottom", -- bottom, top
-- 		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
-- 		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
-- 		winblend = 0,
-- 	},
-- 	layout = {
-- 		height = { min = 4, max = 25 }, -- min and max height of the columns
-- 		width = { min = 20, max = 50 }, -- min and max width of the columns
-- 		spacing = 3, -- spacing between columns
-- 		align = "left", -- align columns left, center or right
-- 	},
-- 	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
-- 	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
-- 	show_help = true, -- show help message on the command line when the popup is visible
-- 	triggers = "auto", -- automatically setup triggers
-- 	-- triggers = {"<leader>"} -- or specify a list manually
-- 	triggers_blacklist = {
-- 		-- list of mode / prefixes that should never be hooked by WhichKey
-- 		-- this is mostly relevant for key maps that start with a native binding
-- 		-- most people should not need to change this
-- 		i = { "j", "k" },
-- 		v = { "j", "k" },
-- 	},
-- }
--
-- local opts = {
-- 	mode = "n", -- NORMAL mode
-- 	prefix = "<leader>",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = true, -- use `nowait` when creating keymaps
-- }
--
-- local mappings = {
-- 	f = {
-- 		name = "File",
-- 		f = { telescope.find_files, "Find File" }, -- create a binding with label
-- 		s = { telescope.live_grep, "Live Grep" },
-- 		e = { "<cmd>NvimTreeToggle<CR>", "Explore" },
-- 	},
-- 	g = {
-- 		name = "Git",
-- 		g = { "<cmd>Neogit<CR>", "Neogit" },
-- 		b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Blame" },
-- 		c = { "<cmd>Telescope git_commits<CR>", "Commits" },
-- 	},
-- 	c = {
-- 		name = "Code",
-- 		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
-- 		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find References" },
-- 		f = { "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>", "Format" },
-- 		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
-- 		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
-- 		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
-- 		p = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
-- 		P = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Workspace Symbols" },
-- 		R = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "References" },
-- 		S = { "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", "Dynamic Workspace Symbols" },
-- 	},
-- 	t = {
-- 		name = "Terminal",
-- 		t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
-- 		n = { "<cmd>ToggleTerm<CR>", "New Terminal" },
-- 		c = { "<cmd>ToggleTerm<CR>", "Close Terminal" },
-- 	},
-- }
--
-- which_key.register(setup)
-- which_key.add(mappings)
