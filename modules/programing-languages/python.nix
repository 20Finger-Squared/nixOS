{ mkConfig, pkgs, ... }@inputs:
mkConfig.mkProgramingLanguageOption "python" inputs {
  environment.systemPackages = [
    pkgs.ruff
    pkgs.basedpyright
  ];
}
