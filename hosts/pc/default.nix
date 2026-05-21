{
  config,
  my-pkgs,
  pkgs,
  ...
}:
{
  software-config.git = true;
  software-config.neovim = true;
  system-config = {
    network = true;
    boot = true;
    users = true;
  };

  security.rtkit.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    printing.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  programs = {
    neovim.enable = true;
  };

  system.stateVersion = "25.11";
}
