{ mkConfig, lib, colourscheme, ... }@module-args:
let
  scheme = colourscheme.noHashtag;
  toScheme = scheme: opacity: "0x${scheme}${opacity}";
  toSchemeFull = scheme: toScheme scheme "FF";
in 
mkConfig.home.software "mangowc" module-args {
  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;

    settings =
      let
        mod = "SUPER";
        s-mod = "${mod}+SHIFT";
      in
      {
        no_radius_when_single = 1;
        gap_inner_horizontal = 8;
        border_color=toSchemeFull scheme.bg;
        focus_color=toSchemeFull scheme.yellow;
        urgent_color=toSchemeFull scheme.red;
        root_color=toSchemeFull scheme.dark-gray;
        border_radius = 25;

        monocle_no = {
          border = 1;
          radius = 1;
          gap = 1;
        };

        always_show_group_bar = 0;
        group_bar = {
          height = 25;
          close_button_enable = 1;
          decorate = {
            font_desc = "Jetbrains Mono NF Bold 8";

            fg_color = toSchemeFull scheme.fg;
            bg_color = toSchemeFull scheme.bg;
          
            focus_fg_color = toSchemeFull scheme.yellow;
            focus_bg_color = toSchemeFull scheme.bg;

            border_color = toSchemeFull scheme.darkest-gray;
            border_width = 5;
          };
        };
        tab_bar = {
          height = 30;
          decorate = {
            font_desc = "Jetbrains Mono NF Bold 10";

            fg_color = toSchemeFull scheme.fg;
            bg_color = toSchemeFull scheme.bg;
          
            focus_fg_color = toSchemeFull scheme.yellow;
            focus_bg_color = toSchemeFull scheme.bg;

            border_color = toSchemeFull scheme.darkest-gray;
            border_width = 5;
          };
        };
        
        jump_label_decorate = rec {
          fg_color = toSchemeFull scheme.fg;
          bg_color = toSchemeFull scheme.bg;

          focus_fg_color = toSchemeFull scheme.yellow;
          focus_bg_color = bg_color;


          border_color = toSchemeFull scheme.yellow;
          border_width = 5;
          corner_radius = 25;

          font_desc = "Jetbrains Mono NF Bold 16";
        };

        bind =
          [
            # Jump mode
            "${s-mod},g,togglejump"

            # General
            "${s-mod},C,killclient"
            "${mod},C,reload_config"

            "${mod},Space,spawn,kitty"
            "${mod},Escape,spawn,fuzzel"

            # Focus cycling
            "${mod},j,focusstack,next"
            "${mod},k,focusstack,prev"

            # Layout
            "${mod},t,setlayout,tile"
            "${s-mod},t,setlayout,deck"
            "${s-mod}+Ctrl,m,spawn,poweroff"
            "${mod},m,setlayout,monocle"

            # Master count
            "${mod},Return,zoom,"
            "${mod},i,incnmaster,+1"
            "${mod},d,incnmaster,-1"

            "NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%+"
            "NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%-"
            "NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle"
            "SHIFT,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SOURCE@ toggle"
          ]
          ++ (lib.genList (i: let index=toString (i+1); in "${mod},${index},view,${index}") 9)
          ++ (lib.genList (i: let index=toString (i+1); in "${s-mod},${index},tag,${index}") 9);
      };
  };
}
