return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-telescope/telescope-live-grep-args.nvim" },
    config = function()
      require("telescope").setup({
        layout_strategy = 'flex',
        layout_config = {
          prompt_position = 'top',
          horizontal = {
            mirror = true,
            preview_cutoff = 100,
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 128,
          },
          height = 0.94,
          width = 0.86,
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}
