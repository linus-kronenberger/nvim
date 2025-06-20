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
  {
  	'rmagatti/auto-session',
  	lazy = false,

  	---enables autocomplete for opts
  	---@module "auto-session"
  	---@type AutoSession.Config
  	opts = {
   	 suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    	-- log_level = 'debug',
  	}
  },
  {
    "brianhuster/autosave.nvim",
    lazy=false,
    event="InsertEnter",
    opts = {} -- Configuration here
  },
  { import = "plugins.nvim-tree", lazy=false},
  { import = "plugins.tabby"},
  { import = "plugins.buffer-admin"},
  { import = "plugins.cmp" },
	{ import = "plugins.lspconfig" },
	{ import = "plugins.autopairs" },
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup()
    end
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        ensure_installed = { "typescript", "tsx", "javascript", "json", "html", "css", "java" },
      })
    end,
  },
})



-- Syntax Highlighting aktivieren
vim.cmd("syntax on")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "ö", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.wo.number = true            -- Absolute Zeilennummern anzeigen
vim.wo.relativenumber = true    -- Relative Zeilennummern anzeigen

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
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "java", "html" },
  callback = function()
    vim.bo.expandtab = true     -- Tabs = Spaces
    vim.bo.tabstop = 2          -- Sichtbare Breite eines Tabs
    vim.bo.shiftwidth = 2       -- Einrückung bei neuer Zeile
    vim.bo.softtabstop = 2      -- Verhalten bei Backspace etc.
  end,
})

vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { desc = 'Nächster Buffer' })

vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { desc = 'Vorheriger Buffer' })

vim.keymap.set('t', '<C-t>', [[<C-\><C-n>]], { desc = 'Terminal: Zurück in den Normal Mode' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


vim.diagnostic.config({
  virtual_text = true,
})

vim.cmd("colorscheme catppuccin")


