{ mkConfig, pkgs, ... }@inputs:
mkConfig.programing-language "lua" inputs {
  environment.systemPackages = [
    pkgs.lua-language-server
    pkgs.luaformatter
  ];
}
