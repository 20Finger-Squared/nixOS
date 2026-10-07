{ pkgs, ... }:
{
  software-config = {
    email = true;
    git = true;
    neovim = false;
    input-remapper = true;
    tailscale = false;
    nh = true;
  };

  system-config = {
    nintendo-controller-support = true;
    graphics = true;
    audio = true;
    boot = true;
    bluetooth = true;
    fonts = true;
    keyboard = true;
    network = true;
    nix = true;
    printing = true;
    security = true;
    users = true;
  };

  desktop-config = {
    steam = true;
    plasma = true;
    hyprland = true;
    qutebrowser = false; # replaced by home-manager
    via = true;
    obsidian = true;
  };

  programing-language-config = {
    c = true;
    python = true;
    nix = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };

  fileSystems."/games" = {
    device = "/dev/disk/by-uuid/5ce6a227-91cd-46d4-8358-3471127946af";
    fsType = "ext4";
  };

  networking.hostName = "pc";
  system.stateVersion = "25.11";
}
