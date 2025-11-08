{ pkgs, ... }:
{
  users.users.tf.packages =
    let
      customWmenu = pkgs.wmenu.overrideAttrs (oldAttrs: rec {
        src = ./wmenu/build/wmenu-run; # path to your copy of wmenu source
        # Or if you just patch the upstream, you might skip src override

        patches = (oldAttrs.patches or [ ]) ++ [ ];

        buildInputs = (oldAttrs.buildInputs or [ ]) ++ [
          pkgs.wlroots # example: if wmenu needs a wayland layer
          pkgs.libxkbcommon # example: keyboard input library
        ];
      });

      customDwlPackage =
        (pkgs.dwl.override {
          configH = ./dwl/config.h;
        }).overrideAttrs
          (oldAttrs: {
            patches = (oldAttrs.patches or [ ]) ++ [
              ./dwl-patches/warpcursor.patch
              ./dwl-patches/gaps.patch
            ];
            buildInputs = oldAttrs.buildInputs or [ ] ++ [
              pkgs.libdrm
              pkgs.fcft
            ];
          });
    in
    [
      customDwlPackage
      customWmenu
    ];
}
