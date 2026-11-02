{
  lib,
  config,
  colourscheme,
  inputs,
  pkgs,
  ...
}:
let
  concat-bindings = lib.concatStringsSep "+";

  process-bindings = map (
    attr:
    let
      wrap = wrap_string: str: wrap_string + str + wrap_string;
      bindings = if builtins.isString attr.keybind then attr.keybind else concat-bindings attr.keybind;
      flags = lib.optionalAttrs (builtins.hasAttr "flags" attr) (lib.genAttrs attr.flags (_: true));
      args = lib.optionalAttrs (builtins.hasAttr "args" attr) attr.args;
    in
    {
      _args = [
        (lib.generators.mkLuaInline (wrap "\"" bindings))
        (lib.generators.mkLuaInline attr.cmd)
        (flags // args)
      ];
    }
  );

  mod = "SUPER";
  s-mod = concat-bindings [
    mod
    "SHIFT"
  ];
in
{
  options.home-manager-config.hyprland = lib.mkEnableOption "My home-manager hyprland config";
  config = lib.mkIf config.home-manager-config.hyprland {
    wayland.windowManager.hyprland = {
      enable = true;
      configType = "lua";
      xwayland.enable = true;
      package = inputs.hyprland-package.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage =
        inputs.hyprland-package.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

      submaps = { };

      settings = {
        monitor = [
          {
            output = "HDMI-A-1";
            position = "auto-left";
            scale = 2;
          }
        ];

        config = {
          master = {
            mfact = 0.7;

            # new windows are added to the top of the master stack
            new_status = "master";
            new_on_top = true;
          };

          general = {
            resize_on_border = true;
            layout = "master";
            gaps_in = 10;
            gaps_out = 20;
            border_size = 4;

            col = {
              active_border = colourscheme.white;
              inactive_border = colourscheme.dark-gray;
            };
          };

          decoration = {
            rounding = 25;
            rounding_power = 4.0;
            blur = {
              enabled = true;
              brightness = 0.8;
              noise = 0.0225;
              passes = 2;
              popups = true;
              size = 5;
              # variant = "acrylic";
            };
            # motion_blur = true;
            # wobble = {
            #   enabled = false;
            #   stiffness = 600;
            #   damping = 25;
            #   mass = 50;
            # };
          };
        };

      /*nixfmt:disable*/
      # nix format is disabled otherwise is does not allow single line attrsets, which I find more readable for this instance.
      bind =
        /*
        Since my way of bindings are different I'll explain the settings.
        The config.bind can have nested lists as they are all flattened before being processed.

        Keybind: list of string ( can be nested )
        Cmd: string ( is converted to litteral lua, is the command to run when the keybind is pressed)
        Flags: list of string ( these are options that are booleans that are passed to the bind cmd within hyprland)
        Args: attrset ( these are options that are to be set to a certain value for example the `desc` flag)
        */
        [

          #####################
          ### CORE BINDINGS ###
          #####################

          # Launchers
          { keybind = [ mod "SPACE" ]; cmd = ''hl.dsp.exec_raw("kitty")'';        flags = [ "locked" "transparent" "dont_inhibit"];
            args.desc = "Core: Open the Terminal."; }
          { keybind = [ mod "TAB"];    cmd = ''hl.dsp.exec_raw("hyprlauncher")''; flags = [ "locked" "transparent" "dont_inhibit"];
            args.desc = "Core: Open the App Launcher."; }

          # TODO:
          # Lock-screen

          { keybind = [ s-mod "C"]; cmd = ''hl.dsp.window.close()''; flags = [ "transparent" "dont_inhibit"];
            args.desc = "Core: Close the Focused App."; }
          { keybind = [ s-mod "M"]; cmd = ''hl.dsp.exit()''; flags = [ "transparent" "dont_inhibit"];
            args.desc = "Core: Exit out of Hyprland."; }

          # poweroff
          { keybind = [ s-mod "CTRL" "M" ]; cmd = ''hl.dsp.exec_raw("poweroff")'';        flags = [ "locked" "transparent" "dont_inhibit"];
            args.desc = "Core: Shutdown the pc"; }

          # Change layout to monocle
          { keybind = [ mod "O" ]; cmd = /*lua*/''hl.dsp.layout("monocle")''; flags = [ "repeating" ];
            args.desc = "Core: Change to monocle layout."; }

          # Change layout to master
          { keybind = [ mod "Y" ]; cmd = /*lua*/''hl.dsp.layout("master")''; flags = [ "repeating" ];
            args.desc = "Core: Change to monocle layout."; }

          ##################
          ### WORKSPACES ###
          ##################

          (lib.genList (i:
          let
            key = toString i;
            # basically map the 0 key to the tenth workspace instead of 0 being mapped to the first
            workspace_id = toString (if i==0 then 10 else i);
          in
          [
            { keybind = [ mod   key]; cmd = "hl.dsp.focus({workspace=${workspace_id}})";   flags = [ "transparent" "dont_inhibit"];
              args.desc = "Core: Change the current workspace to ${workspace_id}."; }
            { keybind = [ s-mod key]; cmd = "hl.dsp.window.move({workspace=${workspace_id},  follow=true})";  flags = [ "transparent" "dont_inhibit"];
              args.desc = "Core: Move the focused window to ${workspace_id} and follow.";
            }]) 10)


          #############
          ### AUDIO ###
          #############

          { keybind = "XF86AudioPlay"; cmd = ''hl.dsp.exec_raw("playerctl play-pause")''; flags = [ "locked" ];
            args.desc = "Play the current media."; }
          { keybind = "XF86AudioStop"; cmd = ''hl.dsp.exec_raw("playerctl stop")'';       flags = [ "locked" ];
            args.desc = "Stop the playing media."; }

          { keybind = "XF86AudioPrev"; cmd = ''hl.dsp.exec_raw("playerctl previous")''; flags = [ "locked" ];
            args.desc = "Play previous media"; }
          { keybind = "XF86AudioNext"; cmd = ''hl.dsp.exec_raw("playerctl next")'';     flags = [ "locked" ];
            args.desc = "Play next media"; }

          { keybind = "XF86AudioRaiseVolume"; cmd = ''hl.dsp.exec_raw("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")''; flags = [ "locked" ];
            args.desc = "Raise the volume."; }
          { keybind = "XF86AudioLowerVolume"; cmd = ''hl.dsp.exec_raw("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")''; flags = [ "locked" ];
            args.desc = "Decrease the volume."; }

          { keybind = "XF86AudioMute";    cmd = ''hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'';   flags = [ "locked" ];
            args.desc = "Mute volume."; }
          { keybind = "XF86AudioMicMute"; cmd = ''hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")''; flags = [ "locked" ];
            args.desc = "Mute the mic"; }

          #######################
          ### LAYOUT BINDINGS ###
          #######################

          # Move focus
          { keybind = [ mod "J" ]; cmd = ''hl.dsp.layout("cyclenext")''; flags = [ "repeating" ];
            args.desc = "Master & Monocle: Change the focus to the next window in the stack."; }

          { keybind = [ mod "K" ]; cmd = ''hl.dsp.layout("cycleprev")''; flags = [ "repeating" ];
            args.desc = "Master & Monocle: Change the focus to the previous window in the stack."; }

          # Swap windows
          { keybind = [ s-mod "J" ]; cmd = ''hl.dsp.layout("swapnext")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Swap the focused window with the next in the stack."; }

          { keybind = [ s-mod "K" ]; cmd = ''hl.dsp.layout("swapprev")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Swap the focused window with the previous in the stack."; }

          # Promote focused window to master
          { keybind = [ mod "Return" ]; cmd = ''hl.dsp.layout("swapwithmaster master")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Promote the focused window to the master."; }

          # Focus master
          { keybind = [ mod "A" ]; cmd = ''hl.dsp.layout("focusmaster")'';
            args.desc = "Master-layout: Change focus to the master."; }

          # Increase / decrease master count
          { keybind = [ mod "I" ]; cmd = ''hl.dsp.layout("addmaster")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Increment the max count of allowed master windows."; }
          { keybind = [ mod "D" ]; cmd = ''hl.dsp.layout("removemaster")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Decrement the max count of allowed master windows."; }

          # Adjust master area ratio
          { keybind = [ mod "H" ]; cmd = ''hl.dsp.layout("mfact -0.05")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Shrink master mfact"; }
          { keybind = [ mod "L" ]; cmd = ''hl.dsp.layout("mfact +0.05")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Increase master mfact"; }

          # Rotate stack windows into master
          { keybind = [ mod "Comma" ]; cmd = ''hl.dsp.layout("rollprev")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Cycle the stack counter-clockwise."; }
          { keybind = [ mod "Period" ]; cmd = ''hl.dsp.layout("rollnext")''; flags = [ "repeating" ];
            args.desc = "Master-layout: Cycle the stack clockwise."; }
        ]
        |> lib.flatten |> process-bindings;
        /*nixfmt:enable*/
      };

      # enables smart gaps
      extraConfig = /* lua */ ''
        hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
        hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

        hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
        hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
        hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
        hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
      '';
    };
  };
}
