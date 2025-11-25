{
  lib,
  config,
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
    plugins = import ./plugins.nix { inherit pkgs; };
  };
}
