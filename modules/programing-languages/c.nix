{ lib, pkgs, ... }@inputs:
lib.mkProgramingLanguageOption "c" inputs {
  environment.systemPackages = [
    # lsp and C compiler
    pkgs.clang-tools
    pkgs.clang
  ];
}
