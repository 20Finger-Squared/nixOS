{
  lib,
  pkgs,
  ...
}:

{
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
          blink-cmp
          gitsigns-nvim
          gruvbox-nvim
          nvim-lspconfig
          markdown-preview-nvim
          mini-nvim
          nvim-treesitter.withAllGrammars
          luasnip
          fzf-lua
        ];
      };
    };
  };
}
