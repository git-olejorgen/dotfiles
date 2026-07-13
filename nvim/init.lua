-- Basic Neovim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.winborder = "rounded"
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true


-- addon install

vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  })

require "mason".setup()
require "lualine".setup({
  sections = {
    lualine_c = { { 'filename', path = 3 } }
  }
})

require "nvim-autopairs".setup()
require('telescope').setup {
  extensions = {
    file_browser = {
      hijack_netrw = true
    }
  }
}

require('telescope').load_extension('file_browser')


-- Markdown rendering
require("render-markdown").setup({
  render_modes = { "n", "c", "t" },
})



-- UI Look and Feel
vim.cmd("colorscheme tokyonight")
vim.cmd(":hi statusline guibg=NONE")
vim.opt.statusline = "%F %m %r %n %w %=%l:%c %p%%"

-- LSP Config
vim.lsp.enable({
  "lua_ls", "cssls", "svelte",
  "ts_ls", "tailwindcss",
  "jsonls", "rust-analyzer"
})

--- LSP

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local opts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next, opts)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})

vim.cmd("set completeopt+=noselect")




-- Keybinds
vim.g.mapleader = ","
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set({'n', 'v', 'x'}, 'y', '"+y', { noremap = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>"')

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>ft', ':Telescope file_browser<CR>')

vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')


vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<S-Tab>', '<gv', { noremap = true, silent = true })


