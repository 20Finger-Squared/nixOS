{
  description = "My custom package collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # Just expose packages, no other outputs
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          # Your packages here
          dwm-script = import ./dwm-script { inherit pkgs; };
          bash = import ./bash { inherit pkgs; };
          tmux = import ./tmux { inherit pkgs; };
          sway = import ./sway { inherit pkgs; };
        }
      );
    };
}
