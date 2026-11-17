{
  description = "My conf";

  nixConfig.extra-experimental-features = [
    "pipe-operators"
  ];

  outputs = inputs:
    let

    lib = inputs.nixpkgs.lib;

    /*
    This can be ignored if you're not gonna look inside ./modules/inner-scope or ./modules/outer-scope/home-manager-modules as these are merely helper functions
    This function is designed to be used alongside currying, which is why it has so many parameters rather than an attribute set.
    All it does is create a boolean option called `${config-tag}.${config-name}'
    It then sets `config` to the given attrset

    Using module-args.lib instead of the local lib was intentional
    I decided to use it instead of the local `lib` to avoid potential issues,
    if I decide to use another library ( For some reason ).
    */
    evaluated_modules = lib.evalModules {
      specialArgs = { inherit inputs; };

      modules = [ (inputs.import-tree ./modules/outer-scope)];
    };
    /*
       As explained earlier the reason we give the `evaluated_modules.config.flake` and not just `evaluated_modules` is because `evaluated_modules.config.flake` is equivalent to outputs.
       The rest (`nixos`) is merely just somewhere to put the hosts settings.
    */
    in evaluated_modules.config.flake;

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
  };
}
