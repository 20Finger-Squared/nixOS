{ pkgs, lib, ... }@inputs:
lib.mkSoftwareOption "neovim" inputs {
  environment = {
    sessionVariables.EDITOR = "nvim";
    systemPackages = [
      # dev setup for nixOS
      pkgs.nixfmt # formatter for dot-nix

      # lsp and C compiler
      pkgs.clang-tools
      pkgs.clang
    ];
  };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      configure = {
        customRC = ''
          lua << EOF
            ${builtins.concatStringsSep "\n" (
              builtins.map builtins.readFile (
                [ ./lua-files/leader-keys.lua ] ++ (filesystem.listFilesRecursive ./lua-files)
              )
            )}
          EOF
        '';
        packages.myVimPackage = with pkgs.vimPlugins; {
          start = [
            conform-nvim
            blink-cmp
            gruvbox-nvim
            nvim-lspconfig
            mini-nvim
            nvim-treesitter.withAllGrammars

            rainbow-delimiters-nvim
            luasnip
            fzf-lua
          ];
        };
      };
    };
  };
}
