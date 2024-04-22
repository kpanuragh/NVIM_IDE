local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end
bufferline.setup({
	highlights = {
		buffer_selected = { italic = false },
		diagnostic_selected = { italic = false },
		hint_selected = { italic = false },
		pick_selected = { italic = false },
		pick_visible = { italic = false },
		pick = { italic = false },
	},
})
vim.keymap.set("n", "gb", "<CMD>BufferLinePick<CR>")
vim.keymap.set("n", "bx", "<CMD>BufferLinePickClose<CR>")
vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>")
vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>")
vim.keymap.set("n", "gs", "<CMD>BufferLineSortByDirectory<CR>")
