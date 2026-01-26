{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (lib) filesystem mkIf mkEnableOption;
in
{
  options.software-config.neovim.enable = mkEnableOption "my neovim config";
  config = mkIf config.software-config.neovim.enable {
    environment = {
      sessionVariables.EDITOR = "nvim";
      systemPackages = [
        # dev setup for nixOS
        pkgs.nixfmt-rfc-style # formatter for dot-nix
        pkgs.nil

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
            markdown-preview-nvim
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
