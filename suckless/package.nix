{ pkgs, ... }:
let
  customWmenu = pkgs.wmenu.overrideAttrs (oldAttrs: rec {
    patches = (oldAttrs.patches or [ ]) ++ [
      ./wmenu/Vim-motions-and-gruvbox.patch
    ];
  });

  customDmenuPackage =
    (pkgs.dmenu.override {
      conf = ./dmenu/config.h;
    }).overrideAttrs
      (oldAttrs: {
        # patches = (oldAttrs.patches or [ ]) ++ [ ];
      });

  customDwlPackage = (pkgs.dwl.override { configH = ./dwl/config.h; }).overrideAttrs (oldAttrs: {
    patches = (oldAttrs.patches or [ ]) ++ [
      ./dwl/warpcursor.patch
      ./dwl/gaps.patch
    ];
  });
in
{
  users.users.tf.packages = [
    customDwlPackage
    customDmenuPackage
    customWmenu
  ];

}
