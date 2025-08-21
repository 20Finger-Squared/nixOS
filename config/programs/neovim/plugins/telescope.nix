{ pkgs }:
{
  plugin = pkgs.vimPlugins.telescope-nvim;
  type = "lua";
  config = # lua
    ''
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fc", builtin.command_history, {})
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fm", builtin.keymaps, {})
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

      vim.keymap.set("n", "<C-s>", builtin.spell_suggest, {})

      require("telescope").setup{
        defaults = {
          layout_strategy = "bottom_pane",
          layout_config = {
            bottom_pane = {
              height = 25,
              preview_cutoff = 120,
              prompt_position = "top"
            },
            center = {
              height = 0.4,
              preview_cutoff = 40,
              prompt_position = "top",
              width = 0.5
            },
            cursor = {
              height = 0.9,
              preview_cutoff = 40,
              width = 0.8
            },
            horizontal = {
              height = 0.9,
              preview_cutoff = 120,
              prompt_position = "bottom",
              width = 0.8
            },
            vertical = {
              height = 0.9,
              preview_cutoff = 40,
              prompt_position = "bottom",
              width = 0.8
            }
          }
        },
        pickers = {
          spell_suggest = {
            theme = "cursor",
          },
          command_history = {
                  theme = "ivy",
              },
          keymaps = {
            theme = "ivy",
          },
        },
      }
    '';
}
