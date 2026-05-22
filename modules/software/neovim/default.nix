{ pkgs, lib, ... }@inputs:
lib.mkSoftwareOption "neovim" inputs {
  environment = {
    sessionVariables.EDITOR = "nvim";
    systemPackages = [
      # dev setup for nixOS
      pkgs.nixfmt # formatter for dot-nix
      pkgs.nixd

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
              [ ./lua-files/leader-keys.lua ] ++ (lib.filesystem.listFilesRecursive ./lua-files)
            )
          )}
        EOF
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          conform-nvim
          blink-cmp
          gruvbox-nvim
          mini-nvim

          rainbow-delimiters-nvim
          luasnip
          fzf-lua
        ];
        opt = [
          nvim-treesitter.withAllGrammars
        ];
      };
    };
  };
}
