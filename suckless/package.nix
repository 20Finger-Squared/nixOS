{ pkgs, ... }:
let
  customWmenu = pkgs.wmenu.overrideAttrs (oldAttrs: rec {
    patches = (oldAttrs.patches or [ ]) ++ [
      ./wmenu/Vim-motions-and-gruvbox.patch
    ];
  });

  customDmenuPackage =
    (pkgs.dmenu.override {
      conf = ./dmenu/config.def.h;
    }).overrideAttrs
      (oldAttrs: {
        # patches = (oldAttrs.patches or [ ]) ++ [ ];
      });

  customDwmPackage = pkgs.dwm.overrideAttrs (oldAttrs: {
    # patches = (oldAttrs.patches or [ ]) ++ [ ];
    postPatch = "cp ${./dwm/config.h} config.h";
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
      windowManager.dwm = {
        enable = true;
        package = customDwmPackage;
      };
    };
  };
}
