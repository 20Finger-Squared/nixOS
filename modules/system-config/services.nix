{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.system-config;
  inherit (lib)
    mkIf
    mkEnableOption
    optionals
    ;
in
{
  options.system-config = {
    security.enable = mkEnableOption "my security config";
    services = {
      misc.enable = mkEnableOption "my misc services config";
      x11.enable = mkEnableOption "my x11 services config";
      audio.enable = mkEnableOption "my audio services config";
      btrfs.enable = mkEnableOption "my btrfs service config";
      desktopManager.enable = mkEnableOption "my desktop manager services config";
    };
  };
  config = {
    environment.systemPackages = (
      (optionals cfg.services.x11.enable [
        pkgs.xclip
        pkgs.clipnotify
      ])
      ++ (optionals cfg.services.desktopManager.enable [
        pkgs.ly
      ])
    );
    security = mkIf cfg.security.enable {
      pam.services.swaylock = { }; # enables sway lock to use pam
      rtkit.enable = true;
      sudo.wheelNeedsPassword = true;
      apparmor.enable = true;
      auditd.enable = true;
      sudo.extraConfig = ''
        Defaults insults
      '';
    };
    services = {
      btrfs.autoScrub = mkIf cfg.services.btrfs.enable {
        enable = true;
        interval = "weekly";
      };
      displayManager = mkIf cfg.services.desktopManager.enable {
        enable = true;
        ly = {
          enable = true; # Ly a simple login screen
          package = pkgs.ly;
          settings = {
            allow_empty_password = false;
            animation = "doom";
            auth_fails = 1;
            box_title = "Best place to login";
            clear_password = true;
            clock = "%x";
          };
        };
      };
      blueman = mkIf cfg.services.audio.enable {
        enable = true;
      };
      pulseaudio.enable = false;
      pipewire = mkIf cfg.services.audio.enable {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      libinput = mkIf cfg.services.misc.enable {
        enable = true;
      };
      printing = mkIf cfg.services.misc.enable {
        enable = true;
      };
      fstrim = mkIf cfg.services.misc.enable {
        enable = true;
      };
      openssh = mkIf cfg.services.misc.enable {
        settings.PermitRootLogin = "no";
      };
      xserver = mkIf cfg.services.x11.enable {
        autoRepeatDelay = 200;
        autoRepeatInterval = 32;
        enable = true;
        xkb.layout = "us";
      };
    };
  };
}
