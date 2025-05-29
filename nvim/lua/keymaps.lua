-- Set mapleader (must be set before any keymaps)
vim.g.mapleader = ","

-- General keymaps
-- Turn off search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Tab management
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>r", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tq", ":tabc<CR>")

-- Clipboard operations
vim.keymap.set("n", "<leader>c", '"+y', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>c", '"+y', { noremap = true, silent = true})

-- LSP keymaps
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

-- File explorer (Neo-tree)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

