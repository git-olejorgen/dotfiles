-- TODO:
-- Add leader / learn the keybinders for telescope and neotree

-- formatting settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Mapleader is to set space in front of motions commands
vim.g.mapleader = ","

-- ui settings
vim.g.background = "light"

-- disable swapping of files
vim.opt.swapfile = false

-- to display line number in left column
vim.wo.number = true

-- turns off search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- These Keymaps are for the LSP Plugin
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

-- tabs
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>r", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tq", ":tabc<CR>")


-- clipboard
vim.keymap.set("n", "<leader>c", '"+y', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>c", '"+y', { noremap = true, silent = true})

