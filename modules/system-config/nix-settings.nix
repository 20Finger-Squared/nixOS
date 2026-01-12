{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.system-config.nix.enable = mkEnableOption "my nix config";
  config = mkIf config.system-config.nix.enable {
    nixpkgs.config.allowUnfree = true;
    nix = {
      settings = {
        auto-optimise-store = true;
        keep-outputs = true;
        keep-derivations = true;
        max-jobs = "auto";
        cores = 0;
        warn-dirty = false;

        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      gc = {
        automatic = true;
        options = "--delete-older-than 30d";
      };
    };
  };
}
