{ pkgs, ... }:
let

  customWmenu = pkgs.wmenu.overrideAttrs (oldAttrs: rec {
    src = ./wmenu; # path to your copy of wmenu source
    # Or if you just patch the upstream, you might skip src override

    #patches = (oldAttrs.patches or [ ]) ++ [ ];

    buildInputs = (oldAttrs.buildInputs or [ ]) ++ [
      pkgs.wlroots # example: if wmenu needs a wayland layer
      pkgs.libxkbcommon # example: keyboard input library
    ];
  });

  customDwmPackage = pkgs.dwm.overrideAttrs (oldAttrs: rec {
    src = ./dwm;
    conf = ./dwm/config.h;
    patches = [ ];
  });

  customDwlPackage = (pkgs.dwl.override { configH = ./dwl/config.h; }).overrideAttrs (oldAttrs: {
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
{
  users.users.tf.packages = [
    customDwlPackage
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
      windowManager.dwm.enable = true;
      windowManager.dwm.package = customDwmPackage;
    };
  };
}
