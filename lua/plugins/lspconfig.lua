return {
  "neovim/nvim-lspconfig",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",          -- Installer für Language Server
    "williamboman/mason-lspconfig.nvim" -- Brücke zwischen Mason & lspconfig
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "ts_ls", "jdtls" },
    })

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})

    -- TypeScript LSP mit Format-Settings
    lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
        -- Optional: Format beim Speichern
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end,
    })
  end,
}

