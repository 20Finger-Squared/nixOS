{ lib, pkgs, ... }@inputs:
lib.mkProgramingLanguageOption "lua" inputs {
  environment.systemPackages = [
    pkgs.lua-language-server
    pkgs.luaformatter
  ];
}
