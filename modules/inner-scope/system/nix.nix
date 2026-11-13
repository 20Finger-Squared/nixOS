{ mkConfig, ... }@inputs:
mkConfig.system "nix" inputs {
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
        "pipe-operators"
        "nix-command"
        "flakes"
      ];
    };

  };
}
