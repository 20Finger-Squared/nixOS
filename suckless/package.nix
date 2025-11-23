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

  customDwmPackage = pkgs.dwm.overrideAttrs (
    oldAttrs:
    let
      configFilePath = ./dwm/config.h;
    in
    {
      postPatch = "cp ${configFilePath} config.def.h; cp ${configFilePath} config.h";
      # patches = (oldAttrs.patches or [ ]) ++ [ ];
    }
  );

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
        # enable = true;
        # package = customDwmPackage;
      };
    };
  };
  services.my-dwm = {
    enable = true;
    borderpx = 3;
    snap = 16;
    modifier = "MOD4MASK";
    showBar = true;
    topBar = true;
    dmenu = {
      font = {
        name = "JetbrainsMono;
        size = 12";
      };
    };
  };
}
