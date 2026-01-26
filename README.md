# My new nixOS config
My nixOS configuration including any tools I am experimenting with.

# TODO
- Create tmux bar configuration
- Create dwm startup script
- Create feh background configuration for dwm
- Replace home-manager with either native modules or wrapper

## Done
- ~~Create st module~~
- ~~Create tmux configuration.~~
- ~~Create Dwm configuration.~~
- ~~Create Dmenu configuration.~~
- ~~Create module for dwm config.h~~
- ~~Fix Dwm not using config.h.~~
- ~~Create qutebrowser configuration.~~

# Features
The whole system is aiming to be Gruvbox themed using the Jetbrains Mono font.
This system is also aimed towards a mouseless workflow via vim motions.
This is because the mouse is yucky, and slow.

This config as of now revolves around X11 software.

## GUI tools
Windows managers are:
- Dwm
- Sway

App launchers are:
- Dmenu

Current web browsers are:
- qutebrowser
- firefox

## Terminal Related
Terminal: st
Terminal multiplexer: Tmux.

Login: Ly due to it's simplicity.

### The shell
Shell: BASH
CLI tools:
- Jq
- ripgrep
- fzf

# Known Issues

## Fixed
- Sometimes keyboard input stops working. The reason of which I have no idea.
- Dwm does not use it's config.h

# Structure
## ./home/
This contains all the home-manager related settings.
- `home/default.nix` contains all settings that apply to all users.
- `home/<user-name>/` is where you should put your user settings.

## ./modules/
This contains all my modules as per the name.
To create a new host create a subdir that is the host name,
with a default.nix inside that imports the other files.

Your hardware-configuration.nix should also be in the root of the subdir.
Without it the system won't build.

Make sure to add your hostname to ./outputs.nix via
`nixosConfigurations.<hostname> = mkSystem "<hostname>";`

The `modules/shared` is applied to all hosts so that you don't
have to write same file multiple times.

## ./custom-modules/
This contains all custom created modules for nixOS.
