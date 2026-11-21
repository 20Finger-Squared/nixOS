{ inputs, ... }:

{
  flake.devShells.x86_64-linux.default = let
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in
  pkgs.mkShell {
    packages = with pkgs; [
      nixd
      nixfmt
    ];
  };
}
