return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",       -- Quelle: Buffer
    "hrsh7th/cmp-path",         -- Quelle: Pfade
    "hrsh7th/cmp-nvim-lsp",     -- Quelle: LSP
    "L3MON4D3/LuaSnip",         -- Snippet-Engine
    "saadparwaiz1/cmp_luasnip", -- Quelle: Snippets
    "rafamadriz/friendly-snippets", -- viele vorgefertigte Snippets
    "onsails/lspkind.nvim",     -- VSCode-ähnliche Icons
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
      },
    })

    vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
  end,
}

