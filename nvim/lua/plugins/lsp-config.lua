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
        ensure_installed = { "lua_ls", "basedpyright", "ts_ls", "html", "cssls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = vim.lsp.config  -- 👈 this is the new API

      local servers = {
        lua_ls = {
          cmd = { "lua-language-server" },
          settings = {
            Lua = { diagnostics = { globals = { "vim" } } }
          }
        },
        basedpyright = {
          cmd = { "basedpyright-langserver", "--stdio" },
        },
        ts_ls = {
          cmd = { "typescript-language-server", "--stdio" },
        },
        html = {
          cmd = { "vscode-html-language-server", "--stdio" },
        },
        cssls = {
          cmd = { "vscode-css-language-server", "--stdio" },
        },
      }

      -- Auto-start language servers based on filetype
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "python", "typescript", "html", "css" },
        callback = function()
          local ft = vim.bo.filetype
          local name
          if ft == "lua" then name = "lua_ls" end
          if ft == "python" then name = "basedpyright" end
          if ft == "typescript" then name = "ts_ls" end
          if ft == "html" then name = "html" end
          if ft == "css" then name = "cssls" end

          if name and servers[name] then
            vim.lsp.start(servers[name])
          end
        end
      })
    end
  }
}
