{ pkgs, lib, ...}@inputs:
lib.mkSoftwareOption "input-remapper" inputs {
  services.ratbagd.enable = true;
  services.input-remapper = {
    enable = true;
    enableUdevRules = true; # ensures hotplugged mice are detected
  };
  environment.systemPackages = [pkgs.polychromatic pkgs.solaar pkgs.piper pkgs.input-remapper];
} 
