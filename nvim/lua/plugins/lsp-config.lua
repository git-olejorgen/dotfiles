-- Mason is a package manger to help with language servers (LSP) and linters. 
return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
      ensure_installed = {"lua_ls",  "basedpyright", "ts_ls", "html", "cssls"}
      })

    end
  },
  {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
    lspconfig.basedpyright.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.html.setup({})
    lspconfig.cssls.setup({})
  end
  }

}
