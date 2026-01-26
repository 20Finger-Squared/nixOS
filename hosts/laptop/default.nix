{
  lib,
  config,
  pkgs,
  ...
}:
{
  software-config = {
    bash.enable = true;
    dmenu.enable = true;
    dwm.enable = true;
    st.enable = true;
    git.enable = true;
    neovim.enable = true;
    nh.enable = true;
    steam.enable = false;
  };
  system-config = {
    boot.enable = true;
    console.enable = true;
    environment.enable = true;
    font.enable = true;
    hardware.enable = true;
    locale.enable = true;
    powerManagement.enable = true;
    documentation.enable = true;
    networking = {
      enable = true;
      hostname = "laptop";
    };
    nix.enable = true;
    services = {
      misc.enable = true;
      x11.enable = true;
      audio.enable = true;
      desktopManager.enable = true;
      btrfs.enable = true;
    };
    security.enable = true;
    zram.enable = true;
    users.enable = true;
  };
  system.stateVersion = "25.05";
}
