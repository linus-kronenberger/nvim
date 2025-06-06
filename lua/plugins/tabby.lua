return {
  "nanozuki/tabby.nvim",
  lazy = false, -- oder true, falls du Lazy Loading bevorzugst
  config = function()
    require("tabby").setup({
      -- Optionale Konfiguration (siehe unten)
    })
  end,
}