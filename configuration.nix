<<<<<<< HEAD
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
=======
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ config, lib, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		];

# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

# Use latest kernel.
	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.hostName = "rhyliePC"; # Define your hostname.
	networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

# Set your time zone.
		time.timeZone = "Europe/London";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
		settings = {
			General = {
				Experimental = true; # Show battery charge of Bluetooth devices
			};
		};
	};

	services.blueman.enable = true;

# Select internationalisation properties.
	i18n.defaultLocale = "en_GB.UTF-8";
	console.keyMap = "uk";

	security.rtkit.enable = true;

	services.pipewire = { enable = true; alsa.enable = true; alsa.support32Bit = true; pulse.enable = true; };
	services.printing.enable = true;
	services.gnome.gnome-keyring.enable = true;

# enable the sway compositor
	programs.sway = { enable = true; wrapperFeatures.gtk = true; };

# enable zsh
	programs.zsh.enable = true;

# enable firefox
	programs.firefox.enable = true;


# Enable touchpad support (enabled default in most desktopManager).
# services.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.rhylie = {
		isNormalUser = true;
		description = "Rhylie";
		shell = pkgs.zsh;
		extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

# programs.firefox.enable = true;

# List packages installed in system profile.
# You can use https://search.nixos.org/ to find more packages (and options).
	environment.systemPackages = with pkgs; [
		tree
		tmux
		git
		grim
		slurp
		zsh
		mako
		neovim
		discord
		wl-clipboard
		vim
		bluez
		networkmanager
		sway
		wget
		rofi
		alacritty
	];
	nixpkgs.config.allowUnfree = true;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
#	system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
# to actually do that.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "25.05"; # Did you read the comment?
>>>>>>> e1f24eb (Init commit)
}
