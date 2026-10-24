{ mkConfig, pkgs, ... }@inputs:
mkConfig.programing-language "c" inputs {
  environment.systemPackages = [
    # lsp and C compiler
    pkgs.clang-tools
    pkgs.clang
  ];
}
