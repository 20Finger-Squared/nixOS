{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      mk-configure = prev.callPackage ./package.nix { };
    })
  ];
}
