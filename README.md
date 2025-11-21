# My new nixOS config

My nixOS configuration including any tools I am experimenting with.
When i consider this configuration to be "stable" i will change it to the main branch, not saying the main branch is usable either.

This configuration is most likely going to be stable once I have done the current TODO tasks.

# Installation instructions
You first need to copy your generated hardware-configuration.nix
`cp /etc/nixos/hardware-configuration.nix ~/nixOS`

Then to run the build command.
If your system does not use btrfs then for now you should chose the `tf-laptop` hostname.
This is because this does not as of now have the btrfs service enabled.

`nixos-rebuild switch --flake ~/nixOS/?submodules=1#<hostname>`

Then for future rebuilds you can use the `rebuild` alias.
This alias does not specify the hostname so your current one will be used.
This alias is only made in bash so if you use another shell you can't use it.

# TODO
- Create Dmenu configuration.
- Create tmux configuration.
- Create Dwm configuration.
- Create template for dwm config.h

## Done
- ~~Fix Dwm not using config.h.~~
- ~~Create qutebrowser configuration.~~

# Features
The whole system is aiming to be Gruvbox themed using the Jetbrains Mono font.

This config is also moving towards X11 due to me having a hoard of problems with the current wayland.
With the movement towards X11 i will be prioritising suckless software due to speed and ease of config.

## GUI tools
Windows managers are:
- Dwl
- Dwm

App launchers are:
- Wmenu
- Dmenu

Current web browsers are:
- qutebrowser
- firefox

The desktop suite is Libreoffice.

## Terminal Related
Terminal: kitty (X11 and Wayland compatible).
Terminal multiplexer: Tmux.

Login: Ly due to it's simplicity.

### The shell
Shell: BASH
CLI tools:
- Jq
- ripgrep
- fzf

# Known Issues
- Sometimes keyboard input stops working. The reason of which I have no idea.
- Dwm does not use it's config.h

# Structure
## home/
This contains all the home-manager related settings.
- `home/default.nix` contains all settings that apply to all users.
- `home/<user-name>/` is where you should put your user settings.

## nix-config/
The core file of this dir is `configuration.nix` of which imports all other files into it.

This was just a matter of taste on how I did the imports you can change the structure back,
but you would have to edit the other files to not get a build error.

If you don't want UK settings for your pc you should edit
- `nix-config/configuration.nix` line 36.
- `nix-config/console.nix` line 3
> TIP: Neovim supports `:e <file> +<line>` out of the box.
> Example: `:e nix-config/configuration.nix +36`

## suckless/
The core file of this dir is `package.nix` of which installs and compiles the suckless software.

If you wish to remove this folder you need to edit `.gitmodules` `outputs.nix`.
