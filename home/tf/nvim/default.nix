{
  lib,
  pkgs,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig =
      let
        combinedContent = builtins.concatStringsSep "\n" (
          builtins.map builtins.readFile (
            [ ./lua-files/leader-keys.lua ] ++ (lib.filesystem.listFilesRecursive ./lua-files)
          )
        );
      in
      combinedContent;

    viAlias = true;
    vimAlias = true;
    plugins = [
      pkgs.vimPlugins.blink-cmp
      pkgs.vimPlugins.gitsigns-nvim
      pkgs.vimPlugins.gruvbox-nvim
      pkgs.vimPlugins.nvim-lspconfig
      pkgs.vimPlugins.markdown-preview-nvim
      pkgs.vimPlugins.mini-nvim
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.luasnip
      pkgs.vimPlugins.fzf-lua
    ];
  };
}
