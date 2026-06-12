{ lib, pkgs, ... }@inputs:
lib.mkProgramingLanguageOption "python" inputs {
  environment.systemPackages = [
    pkgs.ruff
    pkgs.basedpyright
  ];
}
