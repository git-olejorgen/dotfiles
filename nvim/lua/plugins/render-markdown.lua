return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown" },
  config = function()
    require("render-markdown").setup({
      -- optional settings:
      render_modes = { "n", "c", "t" }, -- render in normal, command, terminal modes
      max_file_size = 5.0, -- avoid rendering huge files
      debounce = 100,      -- milliseconds between re-renders
      file_types = { "markdown" }, -- render only for markdown files
    })
  end,
}
