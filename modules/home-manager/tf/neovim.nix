{
  config,
  colourscheme,
  lib,
  ...
}:
let
  lib_nixvim = config.lib.nixvim;
in
{
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      swapfile = false;
      wrap = false;
      relativenumber = true;
      number = true;
      ai = true;
      incsearch = true;
      cursorline = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      signcolumn = "yes";
      termguicolors = true;
      splitright = true;
      splitbelow = true;
      scrolloff = 8;
      sidescrolloff = 8;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      mouse = "a";
      clipboard = "unnamedplus";
      undofile = true;
      confirm = true;
      cmdheight = 0;
    };

    plugins = {
      #TODO render-markdown-nvim.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          keymap = lib_nixvim.mkRaw /* lua */ ''
            {
            preset = "none",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "select_and_accept", "fallback" },
            }'';

          cmdline.enabled = true;
          signature.enabled = true;

          completion = {
            menu.auto_show = false;
            ghost_text.enabled = true;
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 0;
            };
          };
        };
      };
      luasnip.enable = true;

      mini-ai.enable = true;
      mini-align.enable = true;
      mini-move.enable = true;
      mini-surround.enable = true;
      mini-bracketed.enable = true;
      mini-cmdline.enable = true;
      mini-cursorword.enable = true;
      mini-files.enable = true;
      mini-pick.enable = true;
      mini-clue = {
        enable = true;
        settings = {
          clues = [
            (lib_nixvim.mkRaw "require(\"mini.clue\").gen_clues.builtin_completion()")
            (lib_nixvim.mkRaw "require(\"mini.clue\").gen_clues.g()")
            (lib_nixvim.mkRaw "require(\"mini.clue\").gen_clues.marks()")
            (lib_nixvim.mkRaw "require(\"mini.clue\").gen_clues.registers()")
            (lib_nixvim.mkRaw "require(\"mini.clue\").gen_clues.windows()")
            (lib_nixvim.mkRaw "require(\"mini.clue\").gen_clues.z()")

          ];

          window = {
            delay = 0;
            config = {
              width = "auto";

              border = "rounded";
            };
          };

          triggers = lib_nixvim.mkRaw /* lua */ ''
            {
                  -- Leader triggers
                  { mode = { 'n', 'x' }, keys = '<Leader>' },

                  -- `[` and `]` keys
                  { mode = 'n', keys = '[' },
                  { mode = 'n', keys = ']' },

                  -- Built-in completion
                  { mode = 'i', keys = '<C-x>' },

                  -- `g` key
                  { mode = { 'n', 'x' }, keys = 'g' },

                  -- Marks
                  { mode = { 'n', 'x' }, keys = "'" },
                  { mode = { 'n', 'x' }, keys = '`' },

                  -- Registers
                  { mode = { 'n', 'x' }, keys = '"' },
                  { mode = { 'i', 'c' }, keys = '<C-r>' },

                  -- Window commands
                  { mode = 'n', keys = '<C-w>' },

                  -- `z` key
                  { mode = { 'n', 'x' }, keys = 'z' },
                }'';
        };
      };
      mini-trailspace.enable = true;
      mini-icons.enable = true;
    };

    autoGroups.AutoFormatting = {
      clear = true;
    };

    autoCmd = [
      {
        event = [ "BufWritePre" ];
        group = "AutoFormatting";
        callback = lib_nixvim.utils.mkRaw ''
          	      function()
          		vim.lsp.buf.format()
          		MiniTrailspace.trim()
          		MiniTrailspace.trim_last_lines()
          	      end
          	    '';
      }
    ];

    keymaps = [
      {
        mode = "n";
        action = lib_nixvim.mkRaw "MiniPick.builtin.files";
        key = "<leader>ff";

        options.desc = "Open the files picker";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = lib_nixvim.mkRaw "MiniPick.builtin.grep_live";
        options.desc = "Open the grep picker";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = lib_nixvim.mkRaw "MiniPick.builtin.help";
        options.desc = "Open the help picker";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = lib_nixvim.mkRaw "MiniPick.builtin.buffers";
        options.desc = "Open the buffer picker";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = lib_nixvim.mkRaw "MiniPick.builtin.resume";
        options.desc = "Open the last picker";
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = lib_nixvim.mkRaw "MiniFiles.open";
        options.desc = "Open the file tree";
      }
      {
        mode = "n";
        key = "<leader>gf";
        action = lib_nixvim.mkRaw "vim.lsp.buf.format";
        options.desc = "Format the buffer";
      }
    ];

    lsp.servers = {
      nixd = {
        enable = true;

        config = {
          filetypes = [ "nix" ];
          cmd = [ "nixd" ];
          root_markers = [
            "flake.nix"
            ".git"
          ];
        };
      };
    };

    # statusline config
    extraConfigLua =
      let
        colour = {
          fg1 = "#${colourscheme.base07}";
          fg = "#${colourscheme.base04}";
          blue = "#${colourscheme.base0D}";
          light_blue = "#${colourscheme.base0D}";
          red = "#${colourscheme.base08}";
          purple = "#${colourscheme.base0E}";
          orange = "#${colourscheme.base09}";
          bg2 = "#${colourscheme.base02}";
        };

        highlights = {
          mode_colours = [
            "fg1"
            "mode"
          ];
          mode_sep_colours = [
            "mode"
            "bg2"
          ];
          file_colours = [
            "fg1"
            "blue"
          ];
          file_sep_colours = [
            "blue"
            "bg2"
          ];
          file_info_colours = [
            "fg1"
            "light_blue"
          ];
          file_info_left_sep_colours = [
            "light_blue"
            "blue"
          ];
          file_info_sep_colours = [
            "light_blue"
            "bg2"
          ];
          recording_colours = [
            "orange"
            "bg2"
          ];
        };

        setHighlight = name: colours: ''
          vim.api.nvim_set_hl(0, "${name}", {
            fg = colour.${builtins.elemAt colours 0},
            bg = colour.${builtins.elemAt colours 1},
          })
        '';

        highlightLua = lib.concatStrings (
          lib.mapAttrsToList setHighlight (
            builtins.removeAttrs highlights [
              "mode_colours"
              "mode_sep_colours"
            ]
          )
        );
      in
      ''
        local colour = ${lib_nixvim.toLuaObject colour}
        local bar_normal = colour.bg2

        local function set_highlights()
          local mode = vim.api.nvim_get_mode().mode:upper()
          local backgrounds = {
            N = colour.fg,
            I = colour.purple,
            R = colour.red,
            C = colour.orange,
            V = colour.blue,
            ["\22"] = colour.blue,
          }
          local bg = backgrounds[mode] or colour.blue

          vim.api.nvim_set_hl(0, "mode_colours", { fg = colour.fg1, bg = bg })
          vim.api.nvim_set_hl(0, "mode_sep_colours", { fg = bg, bg = bar_normal })
        end

        ${highlightLua}

        local function statusline_mode()
          return vim.api.nvim_get_mode().mode:upper()
        end

        local function statusline_recording()
          local reg = vim.fn.reg_recording()
          return reg ~= "" and "@" .. reg or ""
        end

        _G.statusline_mode = statusline_mode
        _G.statusline_recording = statusline_recording

        local group = vim.api.nvim_create_augroup("StatuslineHighlights", { clear = true })
        vim.api.nvim_create_autocmd("ModeChanged", {
          group = group,
          callback = function()
            set_highlights()
            vim.cmd.redrawstatus()
          end,
        })

        set_highlights()

        vim.o.statusline = table.concat({
          " ",
          "%#mode_sep_colours#",
          "%#mode_colours# %{v:lua.statusline_mode()} ",
          "%#mode_sep_colours#",
          "%#recording_colours# %{v:lua.statusline_recording()}",
          "%=",
          "%#file_sep_colours#",
          "%#file_colours# %F%m %r ",
          "%#file_info_left_sep_colours#",
          "%#file_info_colours# %{&filetype} ",
          "%#file_info_sep_colours#",
          " %2p%% %3l:%-2c ",
        })
      '';
  };

  # yes the descriptions are that deep, to me
  warnings = map (attr: "You have not added a description for the `${attr.key}` binding") (
    builtins.filter (
      attr: !(lib.attrsets.hasAttrByPath [ "options" "desc" ] attr)
    ) config.programs.nixvim.keymaps
  );
}
