-- ~/.config/nvim/lua/plugins/colors.lua
return {
  {
    "morhetz/gruvbox",
    priority = 1000,
    config = function()
      -- Kein termguicolors setzen!
      vim.opt.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },
  -- Alternativ für Iceberg:
  -- {
  --   "cocopon/iceberg.vim",
  --   priority = 1000,
  --   config = function()
  --     vim.opt.background = "dark"
  --     vim.cmd("colorscheme iceberg")
  --   end,
  -- },
}
