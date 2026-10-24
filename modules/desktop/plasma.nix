{ mkConfig, pkgs, ... }@inputs:
mkConfig.mkDesktopOption "plasma" inputs {
  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  programs.kde-pim.enable = true;
  environment.systemPackages = [
    pkgs.kdePackages.plasma-browser-integration
  ];

  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;

    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];

    config.kde = {
      default = [
        "kde"
        "gtk"
      ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "kde" ];
      "org.freedesktop.impl.portal.RemoteDesktop" = [ "kde" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "kde" ];
    };
  };
}
