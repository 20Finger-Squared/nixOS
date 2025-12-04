{ ... }:
{
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
}
