{ mkConfig, pkgs, ... }@inputs:
mkConfig.mkProgramingLanguageOption "lua" inputs {
  environment.systemPackages = [
    pkgs.lua-language-server
    pkgs.luaformatter
  ];
}
