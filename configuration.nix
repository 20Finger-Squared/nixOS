{ config, pkgs, ... }:

{
    imports = [
            ./hardware-configuration.nix
            ./environment.nix
            ./services-security.nix
            ./dwl-wm/package.nix
    ];


    powerManagement.cpuFreq.Governor = "schedutil";
    powerManagement.powertop.enable = true;
    console.earlySetup = true;
    zramSwap.enable = true;
    zramSwap.memoryPercent = 25;
    zramSwap.algorithm = "zstd";
    zramSwap.priority = 10;


# Bootloader.
    boot = {
        kernel.sysctl."vm.swappiness" = 180;
        kernel.sysctl."kernel.unprivileged_bpf_disabled" = 1;
        kernel.sysctl."net.core.bpf_jit_harden" = 2;
        initrd.systemd.enable = true;
        kernelParams = [ "quiet" "splash" ];
        loader = {
            systemd-boot.enable      = true;
            efi.canTouchEfiVariables = true;
            timeout = 1;
        };

        tmp = {
            useTmpfs  = true;
            tmpfsSize = "10%";
        };
    };
# networking and bluetooth
    networking.hostName = "tf-nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/London";

    i18n.defaultLocale = "en_GB.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

# Configure console keymap
    console.keyMap = "uk";

# Configure installed fonts
    fonts = {
        packages = [
            pkgs.noto-fonts-emoji
                pkgs.nerd-fonts.jetbrains-mono
        ];

        fontconfig.defaultFonts = {
            monospace = [ "JetBrainsMono Nerd Font" ];
            emoji = [ "Noto Color Emoji" ];
        };
    };


    users.mutableUsers = false;
    users.users.tf =
    {
        isNormalUser = true;
        description = "Rhylie M. Orton";
        extraGroups = [ "networkmanager" "wheel" "render" "seat" "input" "video"];
        packages = [
            pkgs.lazygit
            pkgs.ripgrep
            pkgs.kitty
            pkgs.eza
            pkgs.steam
            pkgs.krita
        ];
    };

    nix.settings = {
        auto-optimise-store = true;
        keep-outputs        = true;
        keep-deriviations   = true;
        max-jobs = "auto";
        cores = 0;
        warn-dirty = false;
        experimental-features = [ "nix-command" "flakes" ];
        gc = {
            automatic = true;
            options = "--delete-older-than 30d";
        };
    };

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = [ # tiny unopinonated packages or those of which are not relevant to one particular user
        pkgs.wl-clipboard
        pkgs.nixfmt-rfc-style
        pkgs.xdg-desktop-portal
        pkgs.tmux
        pkgs.ly
        pkgs.nil
        pkgs.fzf
        pkgs.jq
        pkgs.xfce.thunar
    ];

    programs.dconf.enable = true;
    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;  # optional, but recommended
    };

    xdg = {
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-wlr
                xdg-desktop-portal-gtk
            ];
        };
    };

    system.stateVersion = "25.05"; # Did you read the comment?
}
