{
  description = "My conf";

  nixConfig.extra-experimental-features = [
    "pipe-operators"
  ];

  outputs = inputs:
    let
    lib = inputs.nixpkgs.lib;

    /*
       As explained within `./modules/outer-scope/flake-output.nix` the reason we give the `evaluated_modules.config.flake` and not just `evaluated_modules` is because `evaluated_modules.config.flake` is equivalent to outputs.
       The rest (`nixos`) is merely just somewhere to put the hosts settings.
    */
    in (lib.evalModules {
      specialArgs = { inherit inputs; };

      modules = [ (inputs.import-tree.filter (file: lib.hasSuffix ".nix" (toString file)) ./modules/outer-scope)];
    }).config.flake;

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixvim.url = "github:nix-community/nixvim";
    hyprland-package.url = "github:hyprwm/Hyprland";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:denful/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
