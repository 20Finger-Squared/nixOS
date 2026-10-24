{ mkConfig, pkgs, ... }@inputs:
mkConfig.mkProgramingLanguageOption "c" inputs {
  environment.systemPackages = [
    # lsp and C compiler
    pkgs.clang-tools
    pkgs.clang
  ];
}
