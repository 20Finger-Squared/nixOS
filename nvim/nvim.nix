{ lib, config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = let
      leaderFile = builtins.readFile ./lua-files/leader-keys.lua;

      filesToInclude = [ leaderFile ] ++ (
        map builtins.readFile lib.filesystem.listFilesRecursive ./lua-files);
      combinedFiles = builtins.concatStringsSep "\n" filesToInclude
    in combinedFiles;

    viAlias = true;
    vimAlias = true;
    plugins = import ./nvim-plugins.nix { inherit pkgs; };
  };
}
