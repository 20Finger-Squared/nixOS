{ pkgs, ... }:
let
  customWmenu = pkgs.wmenu.overrideAttrs (oldAttrs: rec {
    patches = (oldAttrs.patches or [ ]) ++ [
      ./wmenu/Vim-motions-and-gruvbox.patch
    ];
  });

  customDmenuPackage =
    (pkgs.dmenu.override {
      # conf = ./dmenu/config.h;
    }).overrideAttrs
      (oldAttrs: {
        # patches = (oldAttrs.patches or [ ]) ++ [ ];
      });

  customDwmPackage = (pkgs.dwm.override { conf = ./dwm/config.h; }).overrideAttrs (oldAttrs: {
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
    customDwmPackage
    customDmenuPackage
    customWmenu
  ];

  services = {
    picom.enable = true;
    libinput.enable = true;
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 32;
      windowManager.qtile.enable = true;
    };
  };
}
