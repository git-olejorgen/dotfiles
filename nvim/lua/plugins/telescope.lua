-- Fuzzy Finder 
return {
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.5',
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      local builtin = require("telescope.builtin")
      
      -- Standard telescope keymaps
      vim.keymap.set("n","<leader>ff", builtin.find_files, {})
      vim.keymap.set("n","<leader>fg", builtin.live_grep, {})
      
      -- Custom keymaps for home directory (crkbd-friendly)
      vim.keymap.set("n", "<leader>fa", function()
        builtin.find_files({ 
          cwd = vim.fn.expand("~"),
          prompt_title = "Find Files (Home)"
        })
      end, { desc = "Find all files in home directory" })
      
      vim.keymap.set("n", "<leader>ga", function()
        builtin.live_grep({ 
          cwd = vim.fn.expand("~"),
          prompt_title = "Live Grep (Home)"
        })
      end, { desc = "Grep all files in home directory" })
      
      -- Debug: Print to confirm this config ran
      print("Telescope keymaps loaded!")
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {}
    }}})
      require("telescope").load_extension("ui-select")
    end
  },
}
