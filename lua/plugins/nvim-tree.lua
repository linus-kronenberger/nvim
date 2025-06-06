return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false, --fix
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
	  update_focused_file = {
        enable = true,
    },
      update_cwd = true,
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      filesystem_watchers = {
      enable = false,
      },
      })
    end,
    keys = {
	{ "<leader>r", function() require("nvim-tree.api").tree.change_root_to_node()end,
    desc = "Setze Root auf ausgewähltes Verzeichnis in nvim-tree"
  	},
    },
  },
}
