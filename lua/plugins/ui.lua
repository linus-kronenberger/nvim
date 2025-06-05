return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "slant", -- oder "thin", "padded_slant", etc.
        },
      })
    end,
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
    },
    event = "VeryLazy",
  },
}

