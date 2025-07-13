-- Set mapleader (must be set before any keymaps)
vim.g.mapleader = ","

-- General keymaps
-- Turn off search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Tab management
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>r", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tq", ":tabc<CR>")


-- LSP keymaps
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>)", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<leader>(", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {})
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics"})


-- File explorer (Neo-tree)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

