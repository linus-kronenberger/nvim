vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

-- lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("options")

require("lazy").setup({
  { import = "plugins.nvim-tree" },
	{ import = "plugins.cmp" },
	{ import = "plugins.ui" },
	{ import = "plugins.lspconfig" },
	{ import = "plugins.autopairs" },
	{
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup()
    end
  },
  { import = "plugins.colors" }, 
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        ensure_installed = { "typescript", "tsx", "javascript", "json", "html", "css" },
      })
    end,
  },
})

-- Syntax Highlighting aktivieren
vim.cmd("syntax on")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- vim.wo.number = true            -- Absolute Zeilennummern anzeigen
-- vim.wo.relativenumber = true    -- Relative Zeilennummern anzeigen

-- vim.o.showtabline = 0
-- vim.opt_local.expandtab = false
-- vim.opt_local.tabstop = 2
-- vim.opt_local.shiftwidth = 2
-- vim.opt_local.softtabstop = 2
-- vim.g.lazyvim_prettier_needs_config = false
-- vim.bo.tabstop = 2       -- Anzeige eines Tab-Zeichens = 2 Leerzeichen
-- vim.bo.shiftwidth = 2    -- Einzug bei >>, <<, autoindent = 2
-- vim.bo.expandtab = true  -- Tabs in Leerzeichen umwandeln

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.bo.expandtab = true     -- Tabs = Spaces
    vim.bo.tabstop = 2          -- Sichtbare Breite eines Tabs
    vim.bo.shiftwidth = 2       -- Einrückung bei neuer Zeile
    vim.bo.softtabstop = 2      -- Verhalten bei Backspace etc.
  end,
})

