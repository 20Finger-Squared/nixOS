{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
			<home-manager/nixos>
	];

# Bootloader
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

# Use latest kernel
	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;

# Bluetooth
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
	services.blueman.enable = true;

# Time zone & locale
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

# Console keymap
	console.keyMap = "uk";

# X11 disabled (using Wayland via Plasma)
	services.xserver.enable = false;


# Sound with PipeWire
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

# Printing
	services.printing.enable = true;

# Zsh as system shell
	programs.zsh.enable = true;
# Sway as wm
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

# User
	users.users.rhylie = {
		isNormalUser = true;
		description = "Rhylie";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
		packages = with pkgs; [
			kdePackages.kate
		];
	};

# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

# System packages
	environment.systemPackages = with pkgs; [
		neovim
			git
			zsh
			alacritty
			bluez
			blueman
			wl-clipboard
			discord
			firefox
			tmux
	];

	system.stateVersion = "25.05";
}
